library(polywog)


### Name: bootPolywog
### Title: Bootstrap a fitted polywog model
### Aliases: bootPolywog control.bp

### ** Examples

## Using occupational prestige data
data(Prestige, package = "carData")
Prestige <- transform(Prestige, income = income / 1000)

## Fit a polywog model without bootstrapping
## (note: using low convergence threshold to shorten computation time of the
## example, *not* recommended in practice!)
fit1 <- polywog(prestige ~ education + income + type,
                data = Prestige,
                degree = 2,
                thresh = 1e-4)
summary(fit1)

## Bootstrap the fitted model
fit2 <- bootPolywog(fit1, nboot = 5)
summary(fit2)

## Example of parallel processing on Mac/Unix via 'doMC'
## Not run: 
##D library(doMC)
##D registerDoMC()
##D 
##D fit2 <- bootPolywog(fit1, nboot = 100, .parallel = TRUE)
## End(Not run)

## Example of parallel processing on Windows via 'doSMP'
## Not run: 
##D library(doSMP)
##D w <- startWorkers()
##D registerDoSMP(w)
##D 
##D fit2 <- bootPolywog(fit1, nboot = 100, .parallel = TRUE)
##D 
##D stopWorkers(w)
## End(Not run)



