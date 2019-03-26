library(ICE)


### Name: ickde
### Title: Interval-Censored Kernel Density Estimation
### Aliases: ickde
### Keywords: models

### ** Examples

 tmp <- apply(ICHemophiliac, 1, mean)
 h <- try(dpik(tmp), silent=T) # dpik() will work if KernSmooth is loaded
 if (class(h) !="numeric" ) h <- .9  # this makes the example work 
                       # if KernSmooth is not loaded
 estimate <- ickde(ICHemophiliac, m=200, h=h)
 plot(estimate, type="l")



