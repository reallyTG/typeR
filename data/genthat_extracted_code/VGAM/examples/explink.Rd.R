library(VGAM)


### Name: explink
### Title: Exponential Link Function
### Aliases: explink
### Keywords: math models regression

### ** Examples

theta <- rnorm(30)
explink(theta)
max(abs(explink(explink(theta), inverse = TRUE) - theta))  # Should be 0



