library(googleComputeEngineR)


### Name: docker_run
### Title: Run a command in a new container on a host.
### Aliases: docker_run

### ** Examples

## Not run: 
##D docker_run(localhost, "debian:testing", "echo foo")
##D #> foo
##D 
##D # Arguments will be concatenated
##D docker_run(localhost, "debian:testing", c("echo foo", "bar"))
##D #> foo bar
##D 
##D docker_run(localhost, "rocker/r-base", c("Rscript", "-e", "1+1"))
##D #> [1] 2
## End(Not run)



