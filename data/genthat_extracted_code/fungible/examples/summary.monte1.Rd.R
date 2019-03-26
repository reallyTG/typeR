library(fungible)


### Name: summary.monte1
### Title: Summary Method for an Object of Class Monte1
### Aliases: summary.monte1 print.summary.monte1

### ** Examples

## Generate dimensional data for 4 variables. 
## All correlations = .60; all variable
## skewness = 1.75; 
## all variable kurtosis = 3.75

cormat <- matrix(.60, 4, 4)
diag(cormat) <- 1

nontaxon.dat <- monte1(seed = 123, nsub = 100000, nvar = 4, skewvec = rep(1.75, 4),
                 kurtvec = rep(3.75, 4), cormat = cormat)

summary(nontaxon.dat)



