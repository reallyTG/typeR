library(RSuite)


### Name: rc_adapter_get_version
### Title: Retrieves current RC version number for working copy at
###   directory passed.
### Aliases: rc_adapter_get_version

### ** Examples

# create you own RC adapter
rc_adapter_create_own <- function() {
  result <- rc_adapter_create_base("Own")
  class(result) <- c("rc_adapter_own", class(result))
  return(result)
}

#' @export
rc_adapter_get_version.rc_adapter_own <- function(rc_adapter, dir) {
  # ... detect if working copy is consistent with repository state ...
  return(list(has_changes = TRUE,
              revision = "0.0",
              latest = FALSE))
}




