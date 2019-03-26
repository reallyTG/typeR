library(RSuite)


### Name: rc_adapter_create_base
### Title: Creates the base presentation for the RC adapter to use by
###   concrete implementations.
### Aliases: rc_adapter_create_base

### ** Examples

# create you own RC adapter
rc_adapter_create_own <- function() {
  result <- rc_adapter_create_base("Own")
  class(result) <- c("rc_adapter_own", class(result))
  return(result)
}




