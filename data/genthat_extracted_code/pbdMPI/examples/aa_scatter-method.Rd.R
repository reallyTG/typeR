library(pbdMPI)


### Name: scatter-method
### Title: A Rank Scatter Objects to Every Rank
### Aliases: scatter-method scatter,ANY,missing,missing-method
###   scatter,integer,integer,missing-method
###   scatter,numeric,numeric,missing-method scatter,raw,raw,missing-method
###   scatter,ANY,missing,integer-method scatter,ANY,ANY,integer-method
###   scatter,integer,integer,integer-method
###   scatter,numeric,numeric,integer-method scatter,raw,raw,integer-method
###   scatter
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
x <- split(1:(N * .comm.size), rep(1:.comm.size, N))
y <- scatter(lapply(x, matrix, nrow = 1))
comm.print(y)
y <- scatter(x, double(N))
comm.print(y)

### Finish.
finalize()
"
pbdMPI::execmpi(spmd.code, nranks = 2L)



