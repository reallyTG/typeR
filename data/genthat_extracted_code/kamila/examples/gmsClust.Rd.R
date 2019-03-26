library(kamila)


### Name: gmsClust
### Title: A general implementation of Modha-Spangler clustering for
###   mixed-type data.
### Aliases: gmsClust

### ** Examples

## Not run: 
##D # Generate toy data set with poor quality categorical variables and good
##D # quality continuous variables.
##D set.seed(1)
##D dat <- genMixedData(200, nConVar=2, nCatVar=2, nCatLevels=4, nConWithErr=2,
##D   nCatWithErr=2, popProportions=c(.5,.5), conErrLev=0.3, catErrLev=0.8)
##D catDf <- dummyCodeFactorDf(data.frame(apply(dat$catVars, 2, factor)))
##D conDf <- data.frame(scale(dat$conVars))
##D 
##D msRes <- gmsClust(conDf, catDf, nclust=2)
##D 
##D table(msRes$results$cluster, dat$trueID)
## End(Not run)



