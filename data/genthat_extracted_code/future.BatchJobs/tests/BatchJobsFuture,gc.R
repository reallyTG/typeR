source("incl/start.R")

message("*** BatchJobsFuture() and garbage collection ...")

plan(batchjobs_local)

for (how in c("resolve", "value")) {
  f <- future({ 1 })
  print(f)

  if (how == "value") {
    v <- value(f)
    print(v)
  } else if (how == "resolve") {
    resolve(f)
  }

  stopifnot(resolved(f))

  reg <- f$config$reg

  ## Force removal of BatchJobs registry files
  rm(list="f")
  gc()

  ## Assert removal of files only happens if there was not
  ## a failure and option future.delete is not TRUE.
  stopifnot(!file_test("-d", reg$file.dir))
  fail <- try(checkIds(reg, ids=1L), silent=TRUE)
  stopifnot(inherits(fail, "try-error"))
} ## for (how ...)


message("*** BatchJobsFuture() and garbage collection ... DONE")

source("incl/end.R")
