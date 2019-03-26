library(MetabolAnalyze)


### Name: ppcca.metabol.jack
### Title: Fit a probabilistic principal components and covariates analysis
###   model to a metabolomic data set, and assess uncertainty via the
###   jackknife.
### Aliases: ppcca.metabol.jack
### Keywords: methods

### ** Examples

data(UrineSpectra)
## Not run: 
##D mdlfit<-ppcca.metabol.jack(UrineSpectra[[1]], UrineSpectra[[2]][,2], minq=2, maxq=2)
##D loadings.jack.plot(mdlfit)
##D ppcca.scores.plot(mdlfit, UrineSpectra[[2]][,2], group=UrineSpectra[[2]][,1], covarnames="Weight")
## End(Not run)



