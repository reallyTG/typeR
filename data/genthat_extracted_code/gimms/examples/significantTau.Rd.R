library(gimms)


### Name: significantTau
### Title: Compute (Pre-Whitened) Kendall's tau
### Aliases: significantTau significantTau,numeric-method
###   significantTau,RasterStackBrick-method

### ** Examples

## Example taken from ?Kendall::MannKendall
library(Kendall)
data(PrecipGL)
plot(PrecipGL)

## Mann-Kendall trend test without pre-whitening
x <- as.numeric(PrecipGL)
significantTau(x, p = 0.001, prewhitening = FALSE, df = TRUE)

## Mann-Kendall trend test with pre-whitening
significantTau(x, p = 0.001, prewhitening = TRUE, df = TRUE)

#############################################################################
### use case: significant mann-kendall trends in ndvi3g.v0          #########
#############################################################################

## Not run: 
##D ## Sample data from 1982 to 2013
##D data("kili3g.v0")
##D rst <- kili3g.v0[[13:nlayers(kili3g.v0)]]
##D 
##D ## Remove seasonal signal
##D library(remote)
##D dsn <- deseason(rst, cycle.window = 24)
##D 
##D ## Apply trend-free pre-whitened Mann-Kendall test (note that
##D ## non-significant pixels are set to NA)
##D trd1 <- significantTau(dsn, p = 0.01, prewhitening = TRUE)
##D plot(trd1)
##D 
##D ## Or, alternatively, use multi-core functionality
##D cores <- parallel::detectCores() - 1
##D if (require(snow)) {
##D   beginCluster(cores)
##D   trd2 <- significantTau(dsn, p = 0.01, prewhitening = TRUE)
##D   endCluster()
##D }
## End(Not run)




