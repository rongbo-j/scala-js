#!/bin/sh

BASEDIR="`dirname $0`/.."

FULLVER="$1"

case $FULLVER in
  2.10.2)
    VER=2.10
    ;;
  2.10.3)
    VER=2.10
    ;;
  2.10.4)
    VER=2.10
    ;;
  2.11.0)
    VER=2.11
    ;;
  2.11.1)
    VER=2.11
    ;;
  2.11.2)
    VER=2.11
    ;;
esac

REVERSI_EXTDEPS_SIZE=$(stat '-c%s' "$BASEDIR/examples/reversi/target/scala-$VER/reversi-pack-extdeps.js")
REVERSI_INTDEPS_SIZE=$(stat '-c%s' "$BASEDIR/examples/reversi/target/scala-$VER/reversi-pack-intdeps.js")
REVERSI_SELF_SIZE=$(stat '-c%s' "$BASEDIR/examples/reversi/target/scala-$VER/reversi-pack-app.js")
REVERSI_PREOPT_SIZE=$(stat '-c%s' "$BASEDIR/examples/reversi/target/scala-$VER/reversi-fastopt.js")
REVERSI_OPT_SIZE=$(stat '-c%s' "$BASEDIR/examples/reversi/target/scala-$VER/reversi-opt.js")

case $FULLVER in
  2.10.2)
    REVERSI_EXTDEPS_EXPECTEDSIZE=50
    REVERSI_INTDEPS_EXPECTEDSIZE=15300000
    REVERSI_SELF_EXPECTEDSIZE=58000
    REVERSI_PREOPT_EXPECTEDSIZE=983000
    REVERSI_OPT_EXPECTEDSIZE=166000
    ;;
  2.10.3)
    REVERSI_EXTDEPS_EXPECTEDSIZE=50
    REVERSI_INTDEPS_EXPECTEDSIZE=15300000
    REVERSI_SELF_EXPECTEDSIZE=58000
    REVERSI_PREOPT_EXPECTEDSIZE=978000
    REVERSI_OPT_EXPECTEDSIZE=165000
    ;;
  2.10.4)
    REVERSI_EXTDEPS_EXPECTEDSIZE=50
    REVERSI_INTDEPS_EXPECTEDSIZE=15300000
    REVERSI_SELF_EXPECTEDSIZE=58000
    REVERSI_PREOPT_EXPECTEDSIZE=978000
    REVERSI_OPT_EXPECTEDSIZE=165000
    ;;
  2.11.0)
    REVERSI_EXTDEPS_EXPECTEDSIZE=50
    REVERSI_INTDEPS_EXPECTEDSIZE=13300000
    REVERSI_SELF_EXPECTEDSIZE=58000
    REVERSI_PREOPT_EXPECTEDSIZE=967000
    REVERSI_OPT_EXPECTEDSIZE=165000
    ;;
  2.11.1)
    REVERSI_EXTDEPS_EXPECTEDSIZE=50
    REVERSI_INTDEPS_EXPECTEDSIZE=13300000
    REVERSI_SELF_EXPECTEDSIZE=58000
    REVERSI_PREOPT_EXPECTEDSIZE=967000
    REVERSI_OPT_EXPECTEDSIZE=165000
    ;;
  2.11.2)
    REVERSI_EXTDEPS_EXPECTEDSIZE=50
    REVERSI_INTDEPS_EXPECTEDSIZE=13300000
    REVERSI_SELF_EXPECTEDSIZE=58000
    REVERSI_PREOPT_EXPECTEDSIZE=965000
    REVERSI_OPT_EXPECTEDSIZE=164000
    ;;
esac

echo "Reversi extdeps size = $REVERSI_EXTDEPS_SIZE (expected $REVERSI_EXTDEPS_EXPECTEDSIZE)"
echo "Reversi intdeps size = $REVERSI_INTDEPS_SIZE (expected $REVERSI_INTDEPS_EXPECTEDSIZE)"
echo "Reversi self size = $REVERSI_SELF_SIZE (expected $REVERSI_SELF_EXPECTEDSIZE)"
echo "Reversi preopt size = $REVERSI_PREOPT_SIZE (expected $REVERSI_PREOPT_EXPECTEDSIZE)"
echo "Reversi opt size = $REVERSI_OPT_SIZE (expected $REVERSI_OPT_EXPECTEDSIZE)"

[ "$REVERSI_EXTDEPS_SIZE" -le "$REVERSI_EXTDEPS_EXPECTEDSIZE" ] && \
  [ "$REVERSI_INTDEPS_SIZE" -le "$REVERSI_INTDEPS_EXPECTEDSIZE" ] && \
  [ "$REVERSI_SELF_SIZE" -le "$REVERSI_SELF_EXPECTEDSIZE" ] && \
  [ "$REVERSI_PREOPT_SIZE" -le "$REVERSI_PREOPT_EXPECTEDSIZE" ] && \
  [ "$REVERSI_OPT_SIZE" -le "$REVERSI_OPT_EXPECTEDSIZE" ]
