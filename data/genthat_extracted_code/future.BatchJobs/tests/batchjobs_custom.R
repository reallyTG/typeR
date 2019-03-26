source("incl/start.R")
library("listenv")

message("*** batchjobs_custom() ...")


## Technically this could give an error if there is a
## malfunctioning ~/.BatchJobs.R on the test system.
message("*** batchjobs_custom() w/out pathname (default) ...")
plan(batchjobs_custom)

f <- future({
  42L
})
stopifnot(inherits(f, "BatchJobsFuture"))
y <- value(f)
print(y)
stopifnot(y == 42L)

## A global variable
a <- 0
f <- future({
  b <- 3
  c <- 2
  a * b * c
})
print(f)

a <- 7  ## Make sure globals are frozen
v <- value(f)
print(v)
stopifnot(v == 0)

message("*** batchjobs_custom() w/out pathname (default) ... DONE")


message("*** batchjobs_custom() w/ pathname ...")

## BatchJobs configuration R scripts to be tested
path <- system.file("conf", package="future.BatchJobs")
filenames <- c("local.R", "interactive.R")
pathnames <- file.path(path, filenames)

for (pathname in pathnames) {
  message(sprintf("- plan(batchjobs_custom, pathname='%s') ...", pathname))
  plan(batchjobs_custom, pathname=pathname)

  f <- future({
    42L
  })
  stopifnot(inherits(f, "BatchJobsFuture"))
  y <- value(f)
  print(y)
  stopifnot(y == 42L)

  ## A global variable
  a <- 0
  f <- future({
    b <- 3
    c <- 2
    a * b * c
  })
  print(f)

  a <- 7  ## Make sure globals are frozen
  v <- value(f)
  print(v)
  stopifnot(v == 0)

  message(sprintf("- plan(batchjobs_custom, pathname='%s') ... DONE", pathname))
} ## for (pathname ...)

message("*** batchjobs_custom() w/ pathname ... DONE")


message("*** batchjobs_custom() - exceptions ...")

res <- try(f <- batchjobs_custom(42L, conf=TRUE), silent=TRUE)
print(res)
stopifnot(inherits(res, "try-error"))

message("*** batchjobs_custom() - exceptions ... DONE")


message("*** batchjobs_custom() ... DONE")

source("incl/end.R")
