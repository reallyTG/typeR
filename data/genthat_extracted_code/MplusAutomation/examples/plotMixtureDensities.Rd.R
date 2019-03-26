library(MplusAutomation)


### Name: plotMixtureDensities
### Title: Create density plots for mixture models
### Aliases: plotMixtureDensities
### Keywords: mixture models mplus

### ** Examples

## Not run: 
##D createMixtures(classes = 1:3, filename_stem = "iris", rdata = iris)
##D runModels(filefilter = "iris")
##D results <- readModels(filefilter = "iris")
##D plotMixtureDensities(results)
## End(Not run)
## Not run: 
##D plotMixtureDensities(results, variables = "PETAL_LE")
## End(Not run)
## Not run: 
##D plotMixtureDensities(results, bw = TRUE)
## End(Not run)
## Not run: 
##D plotMixtureDensities(results, bw = FALSE, conditional = TRUE)
## End(Not run)
## Not run: 
##D plotMixtureDensities(results[[2]], variables = "PETAL_LE")
## End(Not run)



