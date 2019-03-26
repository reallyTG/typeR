source("incl/start.R")

message("*** nbrOfWorkers() ...")

message("*** nbrOfWorkers() - local, interactive ...")

n <- nbrOfWorkers(batchjobs_local)
message("Number of workers: ", n)
stopifnot(n == 1L)

n <- nbrOfWorkers(batchjobs_interactive)
message("Number of workers: ", n)
stopifnot(n == 1L)

plan(batchjobs_local)
n <- nbrOfWorkers()
message("Number of workers: ", n)
stopifnot(n == 1L)

plan(batchjobs_interactive)
n <- nbrOfWorkers()
message("Number of workers: ", n)
stopifnot(n == 1L)

message("*** nbrOfWorkers() - local, interactive ... DONE")


ncores <- availableCores("multicore")
if (ncores >= 2L) {
message("*** nbrOfWorkers() - multicore ...")

n <- nbrOfWorkers(batchjobs_multicore)
message("Number of workers: ", n)
stopifnot(n == ncores)

plan(batchjobs_multicore)
n <- nbrOfWorkers()
message("Number of workers: ", n)
stopifnot(n == ncores)

workers <- min(2L, ncores)
plan(batchjobs_multicore, workers=workers)
n <- nbrOfWorkers()
message("Number of workers: ", n)
stopifnot(n == workers)

message("*** nbrOfWorkers() - multicore ... DONE")
} ## if (ncores >= 2L)


message("*** nbrOfWorkers() - templates ...")

n <- nbrOfWorkers(batchjobs_lsf)
message("Number of workers: ", n)
stopifnot(is.infinite(n))

n <- nbrOfWorkers(batchjobs_openlava)
message("Number of workers: ", n)
stopifnot(is.infinite(n))

n <- nbrOfWorkers(batchjobs_sge)
message("Number of workers: ", n)
stopifnot(is.infinite(n))

n <- nbrOfWorkers(batchjobs_slurm)
message("Number of workers: ", n)
stopifnot(is.infinite(n))

n <- nbrOfWorkers(batchjobs_torque)
message("Number of workers: ", n)
stopifnot(is.infinite(n))

plan(batchjobs_torque)
n <- nbrOfWorkers()
message("Number of workers: ", n)
stopifnot(is.infinite(n))

n <- nbrOfWorkers(tweak(batchjobs_torque, workers = 2L))
message("Number of workers: ", n)
stopifnot(n == 2L)

plan(batchjobs_torque, workers = 2L)
n <- nbrOfWorkers()
message("Number of workers: ", n)
stopifnot(n == 2L)

message("*** nbrOfWorkers() - templates ... DONE")


message("*** nbrOfWorkers() - conf ...")

n <- nbrOfWorkers(batchjobs_custom)
message("Number of workers: ", n)
stopifnot(is.infinite(n), n > 0)

n <- nbrOfWorkers(tweak(batchjobs_custom, workers=2L))
message("Number of workers: ", n)
stopifnot(n == 2L)

res <- try(n <- nbrOfWorkers(tweak(batchjobs_custom, workers=FALSE)), silent=TRUE)
print(res)
stopifnot(inherits(res, "try-error"))

message("*** nbrOfWorkers() - conf ... DONE")


message("*** nbrOfWorkers() ... DONE")

source("incl/end.R")
