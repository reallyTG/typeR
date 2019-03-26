library(RSuite)


### Name: repo_manager_remove
### Title: Removes specified packages from the repository.
### Aliases: repo_manager_remove

### ** Examples

# create your own repo adapter
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
repo_manager_remove.repo_manager_own <- function(repo_manager, toremove, type) {
  # ... remove packages from the repository ...
  # ... update PACKAGES ...
  return(data.frame(Package = c(),   # return packages removed
                    Version = c(),
                    stringsAsFactors = FALSE))
}




