library(RSuite)


### Name: rc_adapter_is_under_control
### Title: Detects if dir is under adapter's managed version control.
### Aliases: rc_adapter_is_under_control

### ** Examples

# create you own RC adapter
rc_adapter_create_own <- function() {
  result <- rc_adapter_create_base("Own")
  class(result) <- c("rc_adapter_own", class(result))
  return(result)
}

#' @export
rc_adapter_is_under_control.rc_adapter_own <- function(rc_adapter, dir) {
  # ... check ...
  return(TRUE)
}




