library(dlm)


### Name: ARtransPars
### Title: Function to parametrize a stationary AR process
### Aliases: ARtransPars
### Keywords: misc

### ** Examples

(ar <- ARtransPars(rnorm(5)))
all( Mod(polyroot(c(1,-ar))) > 1 ) # TRUE



