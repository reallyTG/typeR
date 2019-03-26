library(RobLox)


### Name: RobLox-package
### Title: Optimally robust influence curves and estimators for location
###   and scale
### Aliases: RobLox-package RobLox
### Keywords: package

### ** Examples

library(RobLox)
ind <- rbinom(100, size=1, prob=0.05) 
x <- rnorm(100, mean=ind*3, sd=(1-ind) + ind*9)
roblox(x)

res <- roblox(x, eps.lower = 0.01, eps.upper = 0.1, returnIC = TRUE)
estimate(res)
confint(res)
confint(res, method = symmetricBias())
pIC(res)

## don't run to reduce check time on CRAN
## Not run: 
##D checkIC(pIC(res))
##D Risks(pIC(res))
##D Infos(pIC(res))
##D plot(pIC(res))
##D infoPlot(pIC(res))
## End(Not run)

## row-wise application
ind <- rbinom(200, size=1, prob=0.05) 
X <- matrix(rnorm(200, mean=ind*3, sd=(1-ind) + ind*9), nrow = 2)
rowRoblox(X)



