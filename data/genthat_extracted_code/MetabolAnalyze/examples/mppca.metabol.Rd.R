library(MetabolAnalyze)


### Name: mppca.metabol
### Title: Fit a mixture of probabilistic principal components analysis
###   (MPPCA) model to a metabolomic data set via the EM algorithm to
###   perform simultaneous dimension reduction and clustering.
### Aliases: mppca.metabol
### Keywords: methods

### ** Examples

data(BrainSpectra)
## Not run: 
##D mdlfit<-mppca.metabol(BrainSpectra[[1]], minq=7, maxq=7, ming=4, maxg=4, 
##D plot.BIC = TRUE)
##D mppca.scores.plot(mdlfit)
##D mppca.loadings.plot(mdlfit, BrainSpectra[[1]])
## End(Not run)



