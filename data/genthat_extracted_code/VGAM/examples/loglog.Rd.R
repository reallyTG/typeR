library(VGAM)


### Name: loglog
### Title: Log-log Link Function
### Aliases: loglog
### Keywords: math models regression

### ** Examples

x <- seq(0.8, 1.5, by = 0.1)
loglog(x)  # Has NAs
loglog(x, bvalue = 1.0 + .Machine$double.eps)  # Has no NAs

x <- seq(1.01, 10, len = 100)
loglog(x)
max(abs(loglog(loglog(x), inverse = TRUE) - x))  # Should be 0



