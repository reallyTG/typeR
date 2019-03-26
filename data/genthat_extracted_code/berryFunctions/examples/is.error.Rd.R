library(berryFunctions)


### Name: is.error
### Title: Check if an expression returns an error
### Aliases: is.error
### Keywords: error programming

### ** Examples

is.error(  log(3)              )
is.error(  log("a")            )
is.error(  log(3),   tell=TRUE )
is.error(  log("a"), tell=TRUE )
stopifnot( is.error( log("a")  )  ) # or shorter:
is.error(  log("a"), force=TRUE)
# is.error(  log(3),   force=TRUE)
stopifnot(is.error(  is.error(log(3), force=TRUE)  ))




