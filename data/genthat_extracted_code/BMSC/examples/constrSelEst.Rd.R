library(BMSC)


### Name: constrSelEst
### Title: Model selection algorithm for constrained estimation
### Aliases: constrSelEst

### ** Examples

## Not run: 
##D set.seed(44)
##D n <- 80
##D x1 <- rnorm(n, sd = 1)
##D x2 <- rnorm(n, sd = 1)
##D x3 <- rnorm(n, sd = 1)
##D y <- 0.4 + 0.3 * x1 + 0.3 * x1 * x3 + 0.4 * x1 ^ 2 * x2 ^ 3 + rnorm(n, sd = 0.3)
##D yUncertainty <- rexp(n, 10) * 0.01
##D data <- data.frame(x1, x2, x3, y, yUncertainty)
##D models <- constrSelEst(y ~ x1 + x2 + x3, mustInclude = "x1", maxExponent = 3,
##D                        interactionDepth = 3, intercept = TRUE,
##D                        constraint_1 = TRUE, data = data,
##D                        yUncertainty = rep(0, nrow(data)), maxNumTerms = 10)
##D bestModel <- getBestModel(models, thresholdSE = 2)
##D print(bestModel)
## End(Not run)



