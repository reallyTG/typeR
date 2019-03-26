library(AzureContainers)


### Name: call_docker
### Title: Call the docker commandline tool
### Aliases: call_docker

### ** Examples

## Not run: 
##D 
##D # without any args, prints the docker help screen
##D call_docker()
##D 
##D # build an image
##D call_docker("build -t myimage .")
##D 
##D # list running containers
##D call_docker("container ls")
##D 
##D # prune unused containers and images
##D call_docker("container prune -f")
##D call_docker("image prune -f")
##D 
## End(Not run)



