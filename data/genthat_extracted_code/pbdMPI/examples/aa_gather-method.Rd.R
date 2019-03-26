library(pbdMPI)


### Name: gather-method
### Title: A Rank Gathers Objects from Every Rank
### Aliases: gather-method gather,ANY,missing,missing-method
###   gather,integer,integer,missing-method
###   gather,numeric,numeric,missing-method gather,raw,raw,missing-method
###   gather,ANY,missing,integer-method gather,ANY,ANY,integer-method
###   gather,integer,integer,integer-method
###   gather,numeric,numeric,integer-method gather,raw,raw,integer-method
###   gather
### Keywords: methods collective

### ** Examples

### Save code in a file "demo.r" and run with 2 processors by
### SHELL> mpiexec -np 2 Rscript demo.r

spmd.code <- "
### Initial.
suppressMessages(library(pbdMPI, quietly = TRUE))
init()
.comm.size <- comm.size()
.comm.rank <- comm.rank()

### Examples.
N <- 5
x <- (1:N) + N * .comm.rank
y <- gather(matrix(x, nrow = 1))
comm.print(y)
y <- gather(x, double(N * .comm.size))
comm.print(y)

### Finish.
finalize()
"
pbdMPI::execmpi(spmd.code, nranks = 2L)



