library(compositions)


### Name: colorsForOutliers
### Title: Create a color/char palette or for groups of outliers
### Aliases: colorsForOutliers1 colorsForOutliers2 pchForOutliers1
### Keywords: multivariate

### ** Examples

## Not run: 
##D data(SimulatedAmounts)
##D data5 <- acomp(sa.outliers5)
##D olc <- OutlierClassifier1(data5)
##D plot(data5,col=colorsForOutliers1(olc)[olc])
##D olc <- OutlierClassifier1(data5,type="all")
##D plot(data5,col=colorsForOutliers2(olc)[olc])
## End(Not run)



