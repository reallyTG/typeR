library(RSuite)


### Name: repo_adapter_get_info
### Title: Returns information about repository the adapter is working on.
### Aliases: repo_adapter_get_info

### ** Examples

# create you own Repo adapter
repo_adapter_create_own <- function() {
  result <- repo_adapter_create_base("Own")
  class(result) <- c("repo_adapter_own", class(result))
  return(result)
}

#' @export
repo_adapter_get_info.repo_adapter_own <- function(repo_adapter, params) {
  return(list(
     readonly = TRUE, # cannot be managed
     reliable = FALSE # package versions can change in time
  ))
}




