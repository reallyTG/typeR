library(unmarked)


### Name: linearComb-methods
### Title: Methods for Function linearComb in Package 'unmarked'
### Aliases: linearComb linearComb-methods
###   linearComb,unmarkedEstimate,matrixOrVector-method
###   linearComb,unmarkedFit,matrixOrVector-method
###   show,unmarkedLinComb-method
### Keywords: methods

### ** Examples

data(ovendata)
ovenFrame <- unmarkedFrameMPois(ovendata.list$data,
siteCovs=as.data.frame(scale(ovendata.list$covariates[,-1])), type = "removal")
fm <- multinomPois(~ 1 ~ ufc + trba, ovenFrame)
linearComb(fm, c(1, 0.5, 0.5), type = "state")
linearComb(fm, matrix(c(1, 0.5, 0.5, 1, 0, 0, 1, 0, 0.5), 3, 3,
  byrow=TRUE), type="state")



