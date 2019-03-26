library(MetabolAnalyze)


### Name: ppca.metabol.jack
### Title: Fit a probabilistic principal components analysis model to a
###   metabolomic data set, and assess uncertainty via the jackknife.
### Aliases: ppca.metabol.jack
### Keywords: methods

### ** Examples

data(UrineSpectra)
## Not run: 
##D mdlfit<-ppca.metabol.jack(UrineSpectra[[1]], minq=2, maxq=2, scale="none")
##D loadings.jack.plot(mdlfit)
##D ppca.scores.plot(mdlfit, group=UrineSpectra[[2]][,1])
## End(Not run)



