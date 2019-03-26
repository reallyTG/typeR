library(MetabolAnalyze)


### Name: ppcca.metabol
### Title: Fit a probabilistic principal components and covariates analysis
###   (PPCCA) model to a metabolomic data set via the EM algorithm.
### Aliases: ppcca.metabol
### Keywords: methods

### ** Examples

data(UrineSpectra)
## Not run: 
##D mdlfit<-ppcca.metabol(UrineSpectra[[1]], UrineSpectra[[2]][,2], minq=2, maxq=2)
##D loadings.plot(mdlfit)
##D ppcca.scores.plot(mdlfit, UrineSpectra[[2]][,2], group=UrineSpectra[[2]][,1], covarnames="Weight")
## End(Not run)



