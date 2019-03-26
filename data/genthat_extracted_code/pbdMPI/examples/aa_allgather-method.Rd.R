library(pbdMPI)


### Name: allgather-method
### Title: All Ranks Gather Objects from Every Rank
### Aliases: allgather-method allgather,ANY,missing,missing-method
###   allgather,integer,integer,missing-method
###   allgather,numeric,numeric,missing-method
###   allgather,raw,raw,missing-method allgather,ANY,missing,integer-method
###   allgather,ANY,ANY,integer-method
###   allgather,integer,integer,integer-method
###   allgather,numeric,numeric,integer-method
###   allgather,raw,raw,integer-method allgather allgatherv
### Keywords: methods collective

### ** Examples

### Save code in a file "demo.r" and run with 2 processors by
### SHELL> mpiexec -np 2 Rscript demo.r

spmd.file <- tempfile()
cat("
### Initial.
suppressMessages(library(pbdMPI, quietly = TRUE))
init()
.comm.size <- comm.size()
.comm.rank <- comm.rank()

### Examples.
N <- 5
x <- (1:N) + N * .comm.rank
y <- allgather(matrix(x, nrow = 1))
comm.print(y)

y <- allgather(x, double(N * .comm.size))
comm.print(y)

### Finish.
finalize()
", file = spmd.file)
pbdMPI::execmpi(spmd.file = spmd.file, nranks = 2L)



