library(pbdMPI)


### Name: pbdMPI-package
### Title: Programming with Big Data - Interface to MPI
### Aliases: pbdMPI-package pbdMPI
### Keywords: package

### ** Examples

## Not run: 
##D ### Under command mode, run the demo with 2 processors by
##D ### (Use Rscript.exe for windows system)
##D # mpiexec -np 2 Rscript -e "demo(allgather,'pbdMPI',ask=F,echo=F)"
##D # mpiexec -np 2 Rscript -e "demo(allreduce,'pbdMPI',ask=F,echo=F)"
##D # mpiexec -np 2 Rscript -e "demo(bcast,'pbdMPI',ask=F,echo=F)"
##D # mpiexec -np 2 Rscript -e "demo(gather,'pbdMPI',ask=F,echo=F)"
##D # mpiexec -np 2 Rscript -e "demo(reduce,'pbdMPI',ask=F,echo=F)"
##D # mpiexec -np 2 Rscript -e "demo(scatter,'pbdMPI',ask=F,echo=F)"
##D ### Or
##D # execmpi("demo(allgather,'pbdMPI',ask=F,echo=F)", nranks = 2L)
##D # execmpi("demo(allreduce,'pbdMPI',ask=F,echo=F)", nranks = 2L)
##D # execmpi("demo(bcast,'pbdMPI',ask=F,echo=F)", nranks = 2L)
##D # execmpi("demo(gather,'pbdMPI',ask=F,echo=F)", nranks = 2L)
##D # execmpi("demo(reduce,'pbdMPI',ask=F,echo=F)", nranks = 2L)
##D # execmpi("demo(scatter,'pbdMPI',ask=F,echo=F)", nranks = 2L)
## End(Not run)



