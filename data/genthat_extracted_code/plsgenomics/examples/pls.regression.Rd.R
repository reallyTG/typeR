library(plsgenomics)


### Name: pls.regression
### Title: Multivariate Partial Least Squares Regression
### Aliases: pls.regression
### Keywords: multivariate

### ** Examples

# load plsgenomics library
library(plsgenomics)

# load the Ecoli data
data(Ecoli)

# perform pls regression
# with unit latent components
pls.regression(Xtrain=Ecoli$CONNECdata,Ytrain=Ecoli$GEdata,Xtest=Ecoli$CONNECdata,
			ncomp=1:3,unit.weights=FALSE)

# with unit weight vectors
pls.regression(Xtrain=Ecoli$CONNECdata,Ytrain=Ecoli$GEdata,Xtest=Ecoli$CONNECdata,
			ncomp=1:3,unit.weights=TRUE)





