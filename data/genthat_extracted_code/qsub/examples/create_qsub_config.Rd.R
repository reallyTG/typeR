library(qsub)


### Name: create_qsub_config
### Title: Create a qsub configuration object.
### Aliases: create_qsub_config override_qsub_config

### ** Examples

## Not run: 
##D qsub_config <- create_qsub_config(
##D   remote = "myuser@myserver.mylocation.com:22",
##D   local_tmp_path = "/home/myuser/workspace/.r2gridengine",
##D   remote_tmp_path = "/scratch/myuser/.r2gridengine"
##D )
##D qsub_lapply(1:10, function(x) x + 1, qsub_config = qsub_config)
##D 
##D set_default_qsub_config(qsub_config, permanent = TRUE)
##D qsub_lapply(1:10, function(x) x + 1)
##D 
##D qsub_lapply(
##D   X = 1:10,
##D   FUN = function(x) x + 1,
##D   qsub_config = override_qsub_config(verbose = TRUE)
##D )
## End(Not run)



