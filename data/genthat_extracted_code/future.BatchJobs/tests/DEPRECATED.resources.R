source("incl/start.R")

message("*** %resources% ...")

## Will generate a warning
plan(batchjobs_local)
x %<-% { 42L } %resources% list(a=1)
print(x)
stopifnot(x == 42L)

message("*** %resources% ... DONE")

source("incl/end.R")
