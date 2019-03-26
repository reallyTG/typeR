library(RSuite)


### Name: repo_adapter_create_base
### Title: Creates base presentation for repo adapter to use by concrete
###   implementations.
### Aliases: repo_adapter_create_base

### ** Examples

# create you own Repo adapter
repo_adapter_create_own <- function() {
  result <- repo_adapter_create_base("Own")
  class(result) <- c("repo_adapter_own", class(result))
  return(result)
}




