source("incl/start.R")
library("listenv")

message("*** batchjobs_local() ...")

message("*** batchjobs_local() without globals")

f <- batchjobs_local({
  42L
})
stopifnot(inherits(f, "BatchJobsFuture"))

## Check whether a batchjobs_local future is resolved
## or not will force evaluation
print(is_resolved <- resolved(f))
stopifnot(is_resolved)

y <- value(f)
print(y)
stopifnot(y == 42L)


message("*** batchjobs_local() with globals")
## A global variable
a <- 0
f <- batchjobs_local({
  b <- 3
  c <- 2
  a * b * c
})
print(f)

## Although 'f' is a batchjobs_local future and therefore
## resolved/evaluates the future expression only
## when the value is requested, any global variables
## identified in the expression (here 'a') are
## "frozen" at the time point when the future is
## created.  Because of this, 'a' preserved the
## zero value although we reassign it below
a <- 7  ## Make sure globals are frozen
##if ("covr" %in% loadedNamespaces()) v <- 0 else ## WORKAROUND
v <- value(f)
print(v)
stopifnot(v == 0)


message("*** batchjobs_local() with globals (tricky)")
x <- listenv()
for (ii in 1:2) x[[ii]] <- batchjobs_local({ ii }, globals=TRUE)
v <- sapply(x, FUN=value)
stopifnot(all(v == 1:2))  ## Make sure globals are frozen


message("*** batchjobs_local() and errors")
f <- batchjobs_local({
  stop("Whoops!")
  1
})
print(f)
v <- value(f, signal=FALSE)
print(v)
stopifnot(inherits(v, "simpleError"))

res <- try({ v <- value(f) }, silent=TRUE)
print(res)
stopifnot(inherits(res, "try-error"))

## Error is repeated
res <- try(value(f), silent=TRUE)
print(res)
stopifnot(inherits(res, "try-error"))

message("*** batchjobs_local() ... DONE")

source("incl/end.R")
