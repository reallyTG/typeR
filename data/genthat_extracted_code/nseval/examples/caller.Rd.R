library(nseval)


### Name: caller
### Title: Find the caller of a given environment.
### Aliases: caller

### ** Examples

E <- environment()
F <- function() {
 Y <- environment()
 caller(Y)
}
identical(F(), E) ## TRUE



