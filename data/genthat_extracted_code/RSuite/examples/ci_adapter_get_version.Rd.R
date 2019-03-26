library(RSuite)


### Name: ci_adapter_get_version
### Title: Retrieves current CI build number.
### Aliases: ci_adapter_get_version

### ** Examples

# create you own CI adapter
ci_adapter_create_own <- function() {
  result <- ci_adapter_create_base("Own")
  class(result) <- c("ci_adapter_own", class(result))
  return(result)
}

#' @export
ci_adapter_get_version.ci_adapter_own <- function(ci_adapter) {
  # ... detect if build triggered by CI is currently running ...
  return("0.0")
}




