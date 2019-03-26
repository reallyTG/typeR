library(ShinyItemAnalysis)


### Name: ggWrightMap
### Title: Wright Map using ggplot
### Aliases: ggWrightMap

### ** Examples

## Not run: 
##D library(mirt)
##D 
##D # loading 100-item medical admission test data sets
##D data(dataMedical)
##D # binary data set
##D dataBin <- dataMedical[, 1:100]
##D 
##D # fit Rasch model with mirt package
##D fit <- mirt(dataBin, model = 1, itemtype = "Rasch")
##D # factor scores
##D theta <- as.vector(fscores(fit))
##D # difficulty estimates
##D b <- coef(fit, simplify = T)$items[, "d"]
##D 
##D ggWrightMap(theta, b)
## End(Not run)



