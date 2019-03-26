library(plsgenomics)


### Name: pls.lda.cv
### Title: Determination of the number of latent components to be used for
###   classification with PLS and LDA
### Aliases: pls.lda.cv
### Keywords: multivariate

### ** Examples

## Not run: 
##D ## between 5~15 seconds
##D # load plsgenomics library
##D library(plsgenomics)
##D 
##D # load leukemia data
##D data(leukemia)
##D 
##D # Determine the best number of components to be used for classification using the 
##D # cross-validation procedure
##D # choose the best number from 2,3,4
##D pls.lda.cv(Xtrain=leukemia$X,Ytrain=leukemia$Y,ncomp=2:4,nruncv=20)
##D # choose the best number from 1,2,3
##D pls.lda.cv(Xtrain=leukemia$X,Ytrain=leukemia$Y,ncomp=3,nruncv=20)
##D 
## End(Not run)



