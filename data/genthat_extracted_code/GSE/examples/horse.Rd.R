library(GSE)


### Name: horse
### Title: Horse-colic data
### Aliases: horse
### Keywords: datasets

### ** Examples

## Not run: 
##D data(horse)
##D horse.cts <- horse[,-c(1,9)] ## remove the id and categorical variable
##D res <- GSE(horse.cts)
##D plot(res, which="dd", xlog10=TRUE, ylog10=TRUE)
##D getOutliers(res)
## End(Not run)



