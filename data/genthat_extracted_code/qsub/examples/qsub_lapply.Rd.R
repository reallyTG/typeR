library(qsub)


### Name: qsub_lapply
### Title: Apply a Function over a List or Vector on a gridengine system!
### Aliases: qsub_lapply

### ** Examples

## Not run: 
##D # Initial configuration and execution
##D qsub_config <- create_qsub_config(
##D   remote = "myserver",
##D   local_tmp_path = "/home/myuser/workspace/.r2gridengine",
##D   remote_tmp_path = "/scratch/myuser/.r2gridengine"
##D )
##D qsub_lapply(
##D   X = seq_len(3),
##D   FUN = function(i) { Sys.sleep(1); i+1 },
##D   qsub_config = qsub_config
##D )
##D 
##D # Setting a default configuration and short hand notation for execution
##D set_default_qsub_config(qsub_config, permanent = T)
##D qsub_lapply(seq_len(3), function(i) { Sys.sleep(1); i+1 })
##D 
##D # Overriding a default qsub_config
##D qsub_lapply(seq_len(3), function(i) i + 1,
##D   qsub_config = override_qsub_config(name = "MyJob"))
##D 
##D # Don't wait for results, get a handle instead and retrieve later.
##D handle <- qsub_lapply(seq_len(3), function(i) i + 1,
##D   qsub_config = override_qsub_config(wait = F))
##D 
##D # Wait until results have been generated on the remote
##D 
##D # Retrieve results
##D qsub_retrieve(handle)
## End(Not run)



