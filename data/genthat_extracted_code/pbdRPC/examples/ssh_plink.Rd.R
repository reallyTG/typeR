library(pbdRPC)


### Name: ssh_plink
### Title: ssh and plink
### Aliases: ssh_plink ssh plink check_exec run_args

### ** Examples

## Not run: 
##D library(pbdRPC, quietly = TRUE)
##D rpcopt_set(user = "snoweye", hostname = "192.168.56.101")
##D 
##D ### Check an R session.
##D cmd <- "Rscript -e 'sessionInfo()'"
##D 
##D ### For Linux, Mac OSX, Solaris.
##D rpc(cmd = cmd, exec.type = "ssh")
##D 
##D ### For Windows.
##D rpc(cmd = cmd, exec.type = "plink")
##D 
##D ### Manually
##D args <- "snoweye@192.168.56.101 Rscript -e 'sessionInfo()'"
##D ssh(args)      # Note ssh uses "-p" for server port.
##D plink(args)    # Note plink uses "-P" for server port.
##D 
##D ### Manually launch a remoter server at background.
##D user.hostname <- "snoweye@192.168.56.101"
##D preload <- "source ./work-my/00_devel_R"
##D rr <- "nohup Rscript -e 'remoter::server()' > .rrlog 2>&1 < /dev/null &"
##D args <- paste(user.hostname, " \"", preload, "; ", rr, "\"", sep = "")
##D plink(args)
## End(Not run)




