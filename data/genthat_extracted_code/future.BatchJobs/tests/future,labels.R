source("incl/start.R")
supportedStrategies <- future:::supportedStrategies

message("*** Futures - labels ...")

strategies <- supportedStrategies()
strategies <- setdiff(strategies, "multiprocess")
strategies <- c("batchjobs_local")

## CRAN processing times:
## On Windows 32-bit, don't run these tests
if (!fullTest && isWin32) strategies <- character(0L)

for (strategy in strategies) {
  message(sprintf("- plan('%s') ...", strategy))
  plan(strategy)

  for (label in list(NULL, sprintf("strategy=%s", strategy))) {
    fcn <- get(strategy, mode="function")
    stopifnot(inherits(fcn, strategy))
    f <- fcn(42, label = label)
    print(f)
    stopifnot(identical(f$label, label))
    v <- value(f)
    stopifnot(v == 42)
    
    f <- future(42, label = label)
    print(f)
    stopifnot(identical(f$label, label))
    v <- value(f)
    stopifnot(v == 42)

    v %<-% { 42 } %label% label
    f <- futureOf(v)
    print(f)
    stopifnot(identical(f$label, label))
    stopifnot(v == 42)

  } ## for (label ...)

  message(sprintf("- plan('%s') ... DONE", strategy))
} ## for (strategy ...)

message("*** Futures - labels ... DONE")

source("incl/end.R")
