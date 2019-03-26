library(pbdRPC)


### Name: rpc_cs_example
### Title: Example Functions of RPC Related to pbdCS
### Aliases: rpc_cs_example check_cs kill_cs start_cs

### ** Examples

## Not run: 
##D library(pbdRPC, quietly = TRUE)
##D # rpcopt_set(user = "snoweye", hostname = "192.168.56.101")
##D m <- machine(user = "snoweye", hostname = "192.168.56.101")
##D 
##D check_cs(m)    # pid 2857 (may differ)
##D kill_cs(m)     # all pbdCS pids are killed
##D check_cs(m)    # make sure no pbdCS R cluster is running
##D 
##D ### use "; " to bypass multiple commands
##D preload <- "source ~/work-my/00_set_devel_R; "
##D 
##D ### start a new pbdCS R cluster
##D start_cs(m, preload = preload)
##D check_cs(m)
##D kill_cs(m)
##D 
##D ### Example: for module load on supercomputers
##D preload <- "module load r; "    # e.g. via module load r
##D start_cs(m, preload = preload)
##D check_cs(m)
##D kill_cs(m)
## End(Not run)





