# contrib/session_exec/Makefile

MODULE_big = session_exec
OBJS = session_exec.o $(WIN32RES)
PGFILEDESC = "session_exec - logging facility for execution plans"

ifdef USE_PGXS
PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)

pg_version := $(word 2,$(shell $(PG_CONFIG) --version))
extensions_supported = $(filter-out 6.% 7.% 8.%,9.0%,$(pg_version))

include $(PGXS)
else
subdir = contrib/session_exec
top_builddir = ../..
include $(top_builddir)/src/Makefile.global
include $(top_srcdir)/contrib/contrib-global.mk
endif
