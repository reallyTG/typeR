library(simsem)


### Name: getCIwidth
### Title: Find confidence interval width
### Aliases: getCIwidth

### ** Examples

## Not run: 
##D loading <- matrix(0, 6, 2)
##D loading[1:3, 1] <- NA
##D loading[4:6, 2] <- NA
##D loadingValues <- matrix(0, 6, 2)
##D loadingValues[1:3, 1] <- 0.7
##D loadingValues[4:6, 2] <- 0.7
##D LY <- bind(loading, loadingValues)
##D latent.cor <- matrix(NA, 2, 2)
##D diag(latent.cor) <- 1
##D RPS <- binds(latent.cor, 0.5)
##D error.cor <- matrix(0, 6, 6)
##D diag(error.cor) <- 1
##D RTE <- binds(error.cor)
##D CFA.Model <- model(LY = LY, RPS = RPS, RTE = RTE, modelType="CFA")
##D 
##D # We make the examples running only 5 replications to save time.
##D # In reality, more replications are needed.
##D Output <- sim(5, n = 200, model=CFA.Model)
##D 
##D # Get the cutoff (critical value) when alpha is 0.05
##D getCIwidth(Output, assurance=0.80)
##D 
##D # Finding the cutoff when the sample size is varied. Note that more fine-grained 
##D # values of n is needed, e.g., n=seq(50, 500, 1)
##D Output2 <- sim(NULL, model=CFA.Model, n=seq(50, 100, 10))
##D 
##D # Get the fit index cutoff when sample size is 75.
##D getCIwidth(Output2, assurance=0.80, nVal = 75)
## End(Not run)



