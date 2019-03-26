library(fungible)


### Name: monte1
### Title: Simulate Multivariate Non-normal Data by Vale & Maurelli (1983)
###   Method
### Aliases: monte1
### Keywords: datagen

### ** Examples


## Generate dimensional data for 4 variables. 
## All correlations = .60; all variable
## skewness = 1.75; 
## all variable kurtosis = 3.75
 
cormat <- matrix(.60,4,4)
diag(cormat) <- 1

nontaxon.dat <- monte1(seed = 123, nsub = 100000, nvar = 4, skewvec = rep(1.75, 4),
               kurtvec = rep(3.75, 4), cormat = cormat)
 
print(cor(nontaxon.dat$data), digits = 3)
print(apply(nontaxon.dat$data, 2, skew), digits = 3)
print(apply(nontaxon.dat$data, 2, kurt), digits = 3)               



