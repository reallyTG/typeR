library(plsgenomics)


### Name: pls.lda
### Title: Classification with PLS Dimension Reduction and Linear
###   Discriminant Analysis
### Aliases: pls.lda
### Keywords: multivariate

### ** Examples

# load plsgenomics library
library(plsgenomics)

# load leukemia data
data(leukemia)

# Classify observations 1,2,3 (test set) using observations 4 to 38 (training set), 
# with 2 PLS components
pls.lda(Xtrain=leukemia$X[-(1:3),],Ytrain=leukemia$Y[-(1:3)],Xtest=leukemia$X[1:3,],
     	ncomp=2,nruncv=0)

# Classify observations 1,2,3 (test set) using observations 4 to 38 (training set), 
# with the best number of components as determined by cross-validation
pls.lda(Xtrain=leukemia$X[-(1:3),],Ytrain=leukemia$Y[-(1:3)],Xtest=leukemia$X[1:3,],
		ncomp=1:4,nruncv=20)




