library(pbdRPC)


### Name: rpc_rr_example
### Title: Example Functions of RPC Related to Remote R Server
### Aliases: rpc_rr_example check_rr checkx_rr kill_rr killx_rr start_rr
###   startx_rr

### ** Examples

## Not run: 
##D library(pbdRPC, quietly = TRUE)
##D # rpcopt_set(user = "snoweye", hostname = "192.168.56.101")
##D m <- machine(user = "snoweye", hostname = "192.168.56.101")
##D 
##D check_rr(m)    # pid 2857 (may differ)
##D kill_rr(m)     # all remoter pids are killed
##D check_rr(m)    # make sure no remoter servers are running
##D 
##D ### use "; " to bypass multiple commands
##D preload <- "source ~/work-my/00_set_devel_R; "
##D 
##D ### start a new remoter server
##D start_rr(m, preload = preload)
##D check_rr(m)
##D kill_rr(m)
##D 
##D ### Example: for module load on supercomputers
##D preload <- "module load r; "    # e.g. via module load r
##D start_rr(m, preload = preload)
##D check_rr(m)
##D kill_rr(m)
## End(Not run)





