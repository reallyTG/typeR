library(EBEN)


### Name: EBelasticNet.Gaussian
### Title: The EB Elastic Net Algorithm for Gaussian Model
### Aliases: EBelasticNet.Gaussian

### ** Examples

library(EBEN)
data(BASIS)
data(y)
n = 50;
k = 100;
BASIS = BASIS[1:n,1:k];
y  = y[1:n];
Blup = EBelasticNet.Gaussian(BASIS, y,lambda = 0.0072,alpha = 0.95, Epis = "no",verbose = 0)
betas 			= Blup$weight
betas



