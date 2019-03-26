library(RSuite)


### Name: repo_manager_destroy
### Title: Releases resources allocated to manage the repository.
### Aliases: repo_manager_destroy

### ** Examples

# create you own repo adapter
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
repo_manager_destroy.repo_manager_own <- function(repo_manager) {
  # ... release resources ...
}




