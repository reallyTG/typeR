library(pRoloc)


### Name: checkFeatureNamesOverlap
### Title: Check feature names overlap
### Aliases: checkFeatureNamesOverlap

### ** Examples

library("pRolocdata")
data(andy2011)
data(andy2011goCC)
checkFeatureNamesOverlap(andy2011, andy2011goCC)
featureNames(andy2011goCC)[1] <- "ABC"
res <- checkFeatureNamesOverlap(andy2011, andy2011goCC)
res$markersX
res$markersY



