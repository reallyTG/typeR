library(BIGL)


### Name: fitSurface
### Title: Fit response surface model and compute meanR and maxR statistics
### Aliases: fitSurface

### ** Examples

## Not run: 
##D   data <- subset(directAntivirals, experiment == 4)
##D   ## Data should contain d1, d2 and effect columns
##D   transforms <- list("PowerT" = function(x, args) with(args, log(x)),
##D                      "InvPowerT" = function(y, args) with(args, exp(y)),
##D                      "BiolT" = function(x, args) with(args, N0 * exp(x * time.hours)),
##D                      "InvBiolT" = function(y, args) with(args, 1/time.hours * log(y/N0)),
##D                      "compositeArgs" = list(N0 = 1, time.hours = 72))
##D   fitResult <- fitMarginals(data, transforms)
##D   surf <- fitSurface(data, fitResult, statistic = "meanR")
##D   summary(surf)
## End(Not run)



