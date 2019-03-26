library(EBEN)


### Name: EBelasticNet.BinomialCV
### Title: Cross Validation (CV) Function to Determine Hyperparameter of
###   the EB_Elastic Net Algorithm for Binomial Model with Normal-Gamma
###   (NG) Prior Distribution
### Aliases: EBelasticNet.BinomialCV

### ** Examples

library(EBEN)
data(BASISbinomial)
data(yBinomial)
#reduce sample size to speed up the running time
n = 50;
k = 100;
N = length(yBinomial);
set.seed(1)
set  = sample(N,n);
BASIS = BASISbinomial[set,1:k];
y  = yBinomial[set];
nFolds = 3
CV = EBelasticNet.BinomialCV(BASIS, y, nFolds = 3,Epis = "no")






