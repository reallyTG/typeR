library(RSuite)


### Name: repo_manager_get_info
### Title: Returns information on repo manager.
### Aliases: repo_manager_get_info

### ** Examples

# create you own Repo adapter
repo_adapter_create_own <- function() {
  result <- repo_adapter_create_base("Own")
  class(result) <- c("repo_adapter_own", class(result))
  return(result)
}

#' create own repo manager
#' @export
repo_adapter_create_manager.repo_adapter_own <- function(repo_adapter, ...) {
  repo_manager <- list() # create you own repo manager
  class(repo_manager) <- c("repo_manager_own", "rsuite_repo_manager")
  return(repo_manager)
}

#' @export
repo_manager_get_info.repo_manager_own <- function(repo_manager) {
  return(list(
     types = c("source", "win-binary"), # package types supported by the manager
     rver = "3.5", # R version supported by the manager
     url = "file:///..." # base URL of repository
  ))
}




