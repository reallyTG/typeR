library(RSuite)


### Name: repo_manager_init
### Title: Initializes managed repository structure.
### Aliases: repo_manager_init

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
repo_manager_init.repo_manager_own <- function(repo_manager, types) {
  was_inited_already <- TRUE
  # ... if repository structure was not initialized initialize it  ...
  return(invisible(was_inited_already))
}




