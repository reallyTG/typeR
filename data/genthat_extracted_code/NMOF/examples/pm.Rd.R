library(NMOF)


### Name: pm
### Title: Partial Moments
### Aliases: pm

### ** Examples

pm(x <- rnorm(100), 2)
var(x)/2

pm(x, 2, normalise = TRUE)
sqrt(var(x)/2)



