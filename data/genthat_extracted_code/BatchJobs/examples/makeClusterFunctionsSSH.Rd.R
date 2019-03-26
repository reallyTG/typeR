library(BatchJobs)


### Name: makeClusterFunctionsSSH
### Title: Create an SSH cluster to execute jobs.
### Aliases: makeClusterFunctionsSSH

### ** Examples

## Not run: 
##D 
##D # Assume you have three nodes larry, curley and moe. All have 6
##D # cpu cores. On curley and moe R is installed under
##D # "/opt/R/R-current" and on larry R is installed under
##D # "/usr/local/R/". larry should not be used extensively because
##D # somebody else wants to compute there as well.
##D # Then a call to 'makeClusterFunctionsSSH'
##D # might look like this:
##D 
##D cluster.functions = makeClusterFunctionsSSH(
##D   makeSSHWorker(nodename = "larry", rhome = "/usr/local/R", max.jobs = 2),
##D   makeSSHWorker(nodename = "curley", rhome = "/opt/R/R-current"),
##D   makeSSHWorker(nodename = "moe", rhome = "/opt/R/R-current"))
## End(Not run)



