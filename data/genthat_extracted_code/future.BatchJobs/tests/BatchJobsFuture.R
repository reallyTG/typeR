source("incl/start.R")

message("*** BatchJobsFuture() ...")

message("*** BatchJobsFuture() - cleanup ...")

f <- batchjobs_local({ 1L })
res <- await(f, cleanup=TRUE)
print(res)
stopifnot(inherits(res, "FutureResult"), res$value == 1L)


message("*** BatchJobsFuture() - cleanup ... DONE")


message("*** BatchJobsFuture() - deleting exceptions ...")

## Deleting a non-resolved future
f <- BatchJobsFuture({ x <- 1 })
res <- tryCatch({
  delete(f)
}, warning = function(w) w)
print(res)
stopifnot(inherits(res, "warning"))

## Printing a deleted future
f <- batchjobs_local(42L)
print(f)
v <- value(f)
print(v)
stopifnot(v == 42L)
res <- delete(f)
print(f)
res <- delete(f)
print(f)

message("*** BatchJobsFuture() - deleting exceptions ... DONE")


message("*** BatchJobsFuture() - registry exceptions ...")

## Non-existing BatchJobs registry
f <- BatchJobsFuture({ x <- 1 })

## Hack to emulate where BatchJobs registry is deleted or fails
f$state <- "running"
path <- f$config$reg$file.dir
unlink(path, recursive=TRUE)

res <- tryCatch({
  value(f)
}, error = function(ex) ex)
print(res)
stopifnot(inherits(res, "error"))

res <- tryCatch({
  await(f)
}, error = function(ex) ex)
print(res)
stopifnot(inherits(res, "error"))


message("*** BatchJobsFuture() - registry exceptions ... DONE")

message("*** BatchJobsFuture() - exceptions ...")

f <- BatchJobsFuture({ 42L })
res <- tryCatch({
  loggedError(f)
}, error = function(ex) ex)
print(res)
stopifnot(inherits(res, "error"))

f <- BatchJobsFuture({ 42L })
res <- tryCatch({
  loggedOutput(f)
}, error = function(ex) ex)
print(res)
stopifnot(inherits(res, "error"))

res <- try(f <- BatchJobsFuture(42L, workers=integer(0)), silent=TRUE)
print(res)
stopifnot(inherits(res, "try-error"))

res <- try(f <- BatchJobsFuture(42L, workers=0L), silent=TRUE)
print(res)
stopifnot(inherits(res, "try-error"))

res <- try(f <- BatchJobsFuture(42L, workers=TRUE), silent=TRUE)
print(res)
stopifnot(inherits(res, "try-error"))

message("*** BatchJobsFuture() - exceptions ... DONE")


message("*** BatchJobsFuture() - timeout ...")

if (fullTest && availableCores(constraints="multicore") > 1) {
  plan(batchjobs_multicore)

  ## Wait only one iteration
  options(future.wait.timeout=0.15, future.wait.interval = 0.1)
  
  f <- future({
    Sys.sleep(2)
    x <- 1
  })
  
  res <- tryCatch({
    value(f)
  }, error = function(ex) ex)
  stopifnot(inherits(res, "error"))
}

message("*** BatchJobsFuture() - timeout ... DONE")



message("*** BatchJobsFuture() ... DONE")

source("incl/end.R")
