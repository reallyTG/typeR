library(simsalapar)


### Name: tryCatch.W.E
### Title: Catching and Storing Warnings and Errors Simultaneously
### Aliases: tryCatch.W.E
### Keywords: programming

### ** Examples

## Adapted from demo(error.catching) :
str(r1 <- tryCatch.W.E( log( 2 ) ) )
str(r2 <- tryCatch.W.E( log(-1 ) ) )
str(r3 <- tryCatch.W.E( log("a") ) )
stopifnot(is.null(r1$warning),
          is.na  (r2$value),   inherits(r2$warning, "warning"),
          is.null(r3$warning), inherits(r3$value, "error"))



