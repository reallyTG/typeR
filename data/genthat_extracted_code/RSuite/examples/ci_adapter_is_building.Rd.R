library(RSuite)


### Name: ci_adapter_is_building
### Title: Detects if build process triggered by CI is currently running.
### Aliases: ci_adapter_is_building

### ** Examples

# create you own CI adapter
ci_adapter_create_own <- function() {
  result <- ci_adapter_create_base("Own")
  class(result) <- c("ci_adapter_own", class(result))
  return(result)
}

#' @export
ci_adapter_is_building.ci_adapter_own <- function(ci_adapter) {
  # ... check ...
  return(TRUE)
}




