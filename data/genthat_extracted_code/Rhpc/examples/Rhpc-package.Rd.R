library(Rhpc)


### Name: Rhpc-package
### Title: permits *apply() style dispatch for HPC
### Aliases: Rhpc-package Rhpc_initialize Rhpc_finalize Rhpc_getHandle
###   Rhpc_worker_call Rhpc_worker_shy Rhpc_worker_noback Rhpc_lapply
###   Rhpc_lapplyLB Rhpc_sapply Rhpc_sapplyLB Rhpc_apply
###   Rhpc_numberOfWorker Rhpc_Export Rhpc_EvalQ Rhpc_setupRNG Rhpc_enquote
###   Rhpc_splitList Rhpc_serialize Rhpc_serialize_onlysize
###   Rhpc_serialize_norealloc Rhpc_unserialize
### Keywords: utilities

### ** Examples

## Not run: 
##D # use Rhpc command
##D Rhpc_initialize()
##D 
##D # If you start the process dynamically on Windows, the dos window of
##D # mpiexec will be created, but you should not close this window.
##D cl <- Rhpc_getHandle(5) # ommit number of worker if use Rhpc batch
##D 
##D # Rhpc set to options
##D opstr=list("Rhpc.mpi.rank","Rhpc.mpi.procs","Rhpc.mpi.c.comm","Rhpc.mpi.f.comm")
##D do.call("options",opstr)
##D Rhpc_worker_call(cl, "do.call","options", opstr)
##D # warning! : pointer not export, worker Rhpc.mpi.c.comm is (nil) on master.
##D 
##D Rhpc_worker_call(cl, Sys.getpid)
##D Rhpc_lapply(cl,1:10000,sqrt)
##D Rhpc_lapplyLB(cl,1:10000,sqrt)
##D Rhpc_sapply(cl,1:10000,sqrt)
##D Rhpc_sapplyLB(cl,1:10000,sqrt)
##D 
##D df<-data.frame(a=1:4,b=5:8)
##D Rhpc_apply(cl,df,1,max)
##D Rhpc_apply(cl,df,2,max)
##D 
##D Rhpc_finalize()
##D #
##D # command line example
##D #
##D # mpirun -n 4 Rhpc CMD BATCH --no-save `script file for exemplified above'
##D #
## End(Not run)



