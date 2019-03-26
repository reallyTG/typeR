library(qsub)


### Name: set_default_qsub_config
### Title: Set a default qsub_config.
### Aliases: set_default_qsub_config

### ** Examples

## Not run: 
##D qsub_config <- create_qsub_config(
##D   remote = "myserver",
##D   local_tmp_path = "/home/myuser/workspace/.r2gridengine",
##D   remote_tmp_path = "/scratch/myuser/.r2gridengine"
##D )
##D set_default_qsub_config(qsub_config, permanent = T)
##D qsub_lapply(1:10, function(x) x + 1)
## End(Not run)




