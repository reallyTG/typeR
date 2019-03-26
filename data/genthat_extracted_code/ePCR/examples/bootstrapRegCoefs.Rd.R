library(ePCR)


### Name: bootstrapRegCoefs
### Title: Bootstrapped testing of regression coefficients in a penalized
###   model
### Aliases: bootstrapRegCoefs

### ** Examples

## Not run: 
##D # Computationally too intensive to run bootstrapped fits <5s
##D data(TYKSSIMU)
##D library(survival)
##D x <- as.matrix(xMEDISIMU)
##D y <- yMEDISIMU[,"surv"]
##D nlambda <- 30
##D psp1 <- new("PSP", alphaseq=c(0, 0.5, 1), nlambda = nlambda, folds = 3, x = x, y = y, seeds = 1)
##D .Object <- psp1
##D alphaopt <- psp1@optimum["Alpha"]
##D bs <- bootstrapRegCoefs(fit = psp1@fit, lambda = psp1@optimum["Lambda"], boot = 100)
##D # Histogram of bootstrapped ps
##D hist(bs$ps, breaks=100)
## End(Not run)



