library(GSE)


### Name: calcium
### Title: Calcium data
### Aliases: calcium
### Keywords: datasets

### ** Examples

## Not run: 
##D data(calcium)
##D ## remove the categorical variables
##D calcium.cts <- subset(calcium, select=-c(obsno, sex, lab, agegroup) )
##D res <- GSE(calcium.cts)
##D getOutliers(res)
##D ## able to identify majority of the contaminated cases identified 
##D ## in the reference
## End(Not run)



