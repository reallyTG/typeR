library(EBEN)


### Name: EBelasticNet.GaussianCV
### Title: Cross Validation (CV) Function to Determine Hyperparameters of
###   the EBEN Algorithm for Gaussian Model
### Aliases: EBelasticNet.GaussianCV

### ** Examples

library(EBEN)
data(BASIS)
data(y)
#reduce sample size to speed up the running time
n = 50;
k = 100;
BASIS = BASIS[1:n,1:k];
y  = y[1:n];
CV = EBelasticNet.GaussianCV(BASIS, y, nFolds = 3,Epis = "no")




