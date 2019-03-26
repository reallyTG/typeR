library(MetabolAnalyze)


### Name: ppca.metabol
### Title: Fit a probabilistic principal components analysis (PPCA) model
###   to a metabolomic data set via the EM algorithm.
### Aliases: ppca.metabol
### Keywords: methods

### ** Examples

data(UrineSpectra)
## Not run: 
##D mdlfit<-ppca.metabol(UrineSpectra[[1]], minq=2, maxq=2, scale="none")
##D loadings.plot(mdlfit)
##D ppca.scores.plot(mdlfit, group=UrineSpectra[[2]][,1])
## End(Not run)



