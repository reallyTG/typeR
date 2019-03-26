library(pbdRPC)


### Name: srpc
### Title: Secure Remote Procedure Call
### Aliases: srpc

### ** Examples

## Not run: 
##D library(pbdRPC, quietly = TRUE)
##D rpcopt_set(user = "snoweye", hostname = "192.168.56.101")
##D 
##D ### see start_rr(), check_rr(), and kill_rr() for more examples.
##D srpc()
##D srpc("ls")
##D srpc("ls ~/work-my")
##D srpc("cat ~/work-my/00_set_devel_R")
##D 
##D ### see ssh(), plink(), and run_args() for lower level examples.
##D 
##D ### Local port forwarding
##D srpc(args = "-N -T -L 55555:localhost:55555")
##D start_rr()
##D 
##D library(remoter)
##D client()    # equivalent to client(addr = "192.168.56.101")
## End(Not run)




