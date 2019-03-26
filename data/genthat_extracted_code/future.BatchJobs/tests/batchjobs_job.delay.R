source("incl/start.R")
library("listenv")

message("*** batchjobs_*() - w/ job.delay ...")

strategies <- c("batchjobs_interactive", "batchjobs_local", "batchjobs_custom")

## CRAN processing times:
## On Windows 32-bit, don't run these tests
if (!fullTest && isWin32) strategies <- character(0L)

for (strategy in strategies) {
  plan(strategy)
  a %<-% { 42 }

  plan(strategy, job.delay=FALSE)
  b %<-% { 42 }
  stopifnot(identical(b, a))

  plan(strategy, job.delay=TRUE)
  b %<-% { 42 }
  stopifnot(identical(b, a))

  job.delay.called <- FALSE
  plan(strategy, job.delay=function(n, i) { job.delay.called <<- TRUE; 0 })
  b %<-% { 42 }
  stopifnot(identical(b, a))
  stopifnot(job.delay.called)

  plan(strategy, job.delay=function(n, i) 1)
  b %<-% { 42 }
  stopifnot(identical(b, a))
} ## for (strategy ...)

message("*** batchjobs_*() - w/ job.delay ... DONE")

source("incl/end.R")

