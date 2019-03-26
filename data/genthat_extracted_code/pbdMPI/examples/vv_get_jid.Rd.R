library(pbdMPI)


### Name: get job id
### Title: Divide Job ID by Ranks
### Aliases: get.jid
### Keywords: utility

### ** Examples

### Save code in a file "demo.r" and run with 4 processors by
### SHELL> mpiexec -np 4 Rscript demo.r

spmd.code <- "
### Initial.
suppressMessages(library(pbdMPI, quietly = TRUE))
init()

### Examples.
comm.cat(\">>> block\n\", quiet = TRUE)
jid <- get.jid(7, method = \"block\")
comm.print(jid, all.rank = TRUE)

comm.cat(\">>> cycle\n\", quiet = TRUE)
jid <- get.jid(7, method = \"cycle\")
comm.print(jid, all.rank = TRUE)

comm.cat(\">>> block (all)\n\", quiet = TRUE)
alljid <- get.jid(7, method = \"block\", all = TRUE)
comm.print(alljid)

comm.cat(\">>> cycle (all)\n\", quiet = TRUE)
alljid <- get.jid(7, method = \"cycle\", all = TRUE)
comm.print(alljid)

### Finish.
finalize()
"
pbdMPI::execmpi(spmd.code, nranks = 4L)



