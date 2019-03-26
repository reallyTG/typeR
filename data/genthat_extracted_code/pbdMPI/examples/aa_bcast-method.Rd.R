library(pbdMPI)


### Name: bcast-method
### Title: A Rank Broadcast an Object to Every Rank
### Aliases: bcast-method bcast,ANY-method bcast,integer-method
###   bcast,numeric-method bcast,raw-method bcast
### Keywords: methods collective

### ** Examples

### Save code in a file "demo.r" and run with 2 processors by
### SHELL> mpiexec -np 2 Rscript demo.r

spmd.code <- "
### Initial.
suppressMessages(library(pbdMPI, quietly = TRUE))
init()

### Examples.
x <- matrix(1:5, nrow = 1)
y <- bcast(x)
comm.print(y)

### Finish.
finalize()
"
pbdMPI::execmpi(spmd.code, nranks = 2L)



