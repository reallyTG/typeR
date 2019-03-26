library(pbdMPI)


### Name: global balanc
### Title: Global Balance Functions
### Aliases: comm.balance.info comm.load.balance comm.unload.balance
### Keywords: utility

### ** Examples

## Not run: 
##D ### Save code in a file "demo.r" and run with 4 processors by
##D ### SHELL> mpiexec -np 4 Rscript demo.r
##D 
##D spmd.code <- "
##D ### Initial.
##D suppressMessages(library(pbdMPI, quietly = TRUE))
##D 
##D ### Get two gbd row-block data.frame.
##D da.block <- iris[get.jid(nrow(iris), method = \"block\"),]
##D da.block0 <- iris[get.jid(nrow(iris), method = \"block0\"),]
##D 
##D ### Load balance one and unload it.
##D bal.info <- comm.balance.info(da.block0)
##D da.new <- comm.load.balance(da.block0)
##D da.org <- comm.unload.balance(da.new, bal.info)
##D 
##D ### Check if all are equal.
##D comm.print(c(sum(da.new != da.block), sum(da.org != da.block0)),
##D            all.rank = TRUE)
##D 
##D ### Finish.
##D finalize()
##D "
##D # execmpi(spmd.code, nranks = 4L)
## End(Not run)



