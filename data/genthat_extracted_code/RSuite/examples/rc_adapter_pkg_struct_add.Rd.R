library(RSuite)


### Name: rc_adapter_pkg_struct_add
### Title: Puts the package structure under RC adapter's managed version
###   control.
### Aliases: rc_adapter_pkg_struct_add

### ** Examples

# create you own RC adapter
rc_adapter_create_own <- function() {
  result <- rc_adapter_create_base("Own")
  class(result) <- c("rc_adapter_own", class(result))
  return(result)
}

#' @export
rc_adapter_pkg_struct_add.rc_adapter_own <- function(rc_adapter, params, name) {
  # ... add package specified by name under RC in project specified by params ...
}




