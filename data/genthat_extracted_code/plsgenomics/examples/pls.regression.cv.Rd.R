library(plsgenomics)


### Name: pls.regression.cv
### Title: Determination of the number of latent components to be used in
###   PLS regression
### Aliases: pls.regression.cv
### Keywords: multivariate

### ** Examples

## Not run: 
##D ## between 5~15 seconds
##D # load plsgenomics library
##D library(plsgenomics)
##D 
##D # load Ecoli data
##D data(Ecoli)
##D 
##D # determine the best number of components for PLS regression using the cross-validation approach
##D # choose the best number from 1,2,3,4
##D pls.regression.cv(Xtrain=Ecoli$CONNECdata,Ytrain=Ecoli$GEdata,ncomp=4,nruncv=20)
##D # choose the best number from 2,3
##D pls.regression.cv(Xtrain=Ecoli$CONNECdata,Ytrain=Ecoli$GEdata,ncomp=c(2,3),nruncv=20)
##D 
## End(Not run)



