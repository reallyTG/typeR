library(EBEN)


### Name: EBelasticNet.Binomial
### Title: The EB Elastic Net Algorithm for Binomial Model with
###   Normal-Gamma(NG) Prior Distribution
### Aliases: EBelasticNet.Binomial

### ** Examples

library(EBEN)
data(BASISbinomial)
data(yBinomial)
#reduce sample size to speed up the running time
n = 50;
k = 100;
N = length(yBinomial);
set  = sample(N,n);
BASIS = BASISbinomial[set,1:k];
y  = yBinomial[set];
output = EBelasticNet.Binomial(BASIS, y,lambda = 0.1,alpha = 0.5, Epis = "no",verbose = 5)



