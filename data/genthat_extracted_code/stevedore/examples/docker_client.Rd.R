library(stevedore)


### Name: docker_client
### Title: Create docker client
### Aliases: docker_client

### ** Examples

if (stevedore::docker_available()) {
  # Create a new client object:
  client <- stevedore::docker_client()

  # Version information for your docker daemon:
  client$version()

  # General information about your daemon:
  client$info()

  # Most of the interesting methods are within the collections.
  # For example, to see a summary of running containers:
  client$container$list()

  # (see ?docker_container) for more information.
}



