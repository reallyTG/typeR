library(RSuite)


### Name: repo_adapter_get_path
### Title: Returns the adapter path related to the project to use for
###   dependencies resolution.
### Aliases: repo_adapter_get_path

### ** Examples

# create you own Repo adapter
repo_adapter_create_own <- function() {
  result <- repo_adapter_create_base("Own")
  class(result) <- c("repo_adapter_own", class(result))
  return(result)
}

#' @export
repo_adapter_get_path.repo_adapter_own <- function(repo_adapter, params, ix = NA) {
  # get arguments of the repo adapter specified in project PARAMETERS
  arg <- params$get_repo_adapter_arg(repo_adapter$name, default = "", ix = ix)
  url <- "https://..." # make url to repository base on arg
  return(url)
}




