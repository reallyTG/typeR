library(pbdMPI)


### Name: reduce-method
### Title: A Rank Receive a Reduction of Objects from Every Rank
### Aliases: reduce-method reduce,ANY,missing-method
###   reduce,integer,integer-method reduce,numeric,numeric-method
###   reduce,logical,logical-method reduce,float32,float32-method reduce
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
y <- reduce(matrix(x, nrow = 1), op = \"sum\")
comm.print(y)

y <- reduce(x, double(N), op = \"prod\")
comm.print(y)

x <- as.logical(round(runif(N)))
y <- reduce(x, logical(N), op = \"land\")
comm.print(y)

### Finish.
finalize()
"
pbdMPI::execmpi(spmd.code = spmd.code, nranks = 2L)



