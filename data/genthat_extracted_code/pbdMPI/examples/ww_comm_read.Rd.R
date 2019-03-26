library(pbdMPI)


### Name: global reading
### Title: Global Reading Functions
### Aliases: comm.read.table comm.read.csv comm.read.csv2
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
##D ### Check.
##D if(comm.size() != 4){
##D   comm.stop(\"4 processors are requried.\")
##D }
##D 
##D ### Manually distributed iris.
##D da <- iris[get.jid(nrow(iris)),]
##D 
##D ### Dump data.
##D comm.write.table(da, file = \"iris.txt\", quote = FALSE, sep = \"\\t\",
##D                  row.names = FALSE)
##D 
##D ### Read back in.
##D da.gbd <- comm.read.table(\"iris.txt\", header = TRUE, sep = \"\\t\",
##D                           quote = \"\")
##D comm.print(c(nrow(da), nrow(da.gbd)), all.rank = TRUE)
##D 
##D ### Read in common.
##D da.common <- comm.read.table(\"iris.txt\", header = TRUE, sep = \"\\t\",
##D                              quote = \"\", read.method = \"common\")
##D comm.print(c(nrow(da.common), sum(da.common != iris)))
##D 
##D ### Finish.
##D finalize()
##D "
##D # execmpi(spmd.code, nranks = 4L)
## End(Not run)



