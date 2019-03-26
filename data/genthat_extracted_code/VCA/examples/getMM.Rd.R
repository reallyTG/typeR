library(VCA)


### Name: getMM
### Title: Overparameterized Design Matrices.
### Aliases: getMM

### ** Examples

## Not run: 
##D # load example data (CLSI EP05-A2 Within-Lab Precision Experiment)
##D data(dataEP05A2_3)
##D tmpData <- dataEP05A2_3[1:10,] 
##D 
##D # check out the differences
##D getMM(~day+day:run, tmpData)
##D model.matrix(~day+day:run, tmpData)
##D 
##D # adapt factor variables in 'tmpData'
##D tmpData$day <- factor(tmpData$day)
##D 
##D # check out the differences now
##D getMM(~day+day:run, tmpData)
##D model.matrix(~day+day:run, tmpData)
##D 
##D # numeric covariate 'cov'
##D tmpData2 <- dataEP05A2_3[1:10,] 
##D tmpData2$cov <- 10+rnorm(10,,3)
##D model.matrix(~day*cov, tmpData2)
## End(Not run)




