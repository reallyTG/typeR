library(RSuite)


### Name: ci_adapter_create_base
### Title: Creates the base presentation for the CI adapter to use by
###   concrete implementations.
### Aliases: ci_adapter_create_base

### ** Examples

# create you own CI adapter
ci_adapter_create_own <- function() {
  result <- ci_adapter_create_base("Own")
  class(result) <- c("ci_adapter_own", class(result))
  return(result)
}




