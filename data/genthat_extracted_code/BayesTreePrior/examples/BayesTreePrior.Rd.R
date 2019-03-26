library(BayesTreePrior)


### Name: BayesTreePrior
### Title: Simulation of the tree prior.
### Aliases: BayesTreePrior

### ** Examples

#Case 1 : Unrealistic case where we assume that the number of var/obs is infinite and beta=0
results1 = BayesTreePrior(.45,0)
#Case 2 : Unrealistic case where we assume that the number of var/obs is infinite
results2 = BayesTreePrior(.95,.5)
#Case 3 : One variable with a finite number of observations
results3 = BayesTreePrior(.95,.5,n_obs=150)
if (requireNamespace("MASS", quietly = TRUE)) {
    #Case 4 : General case, without missing data
    x1 = MASS::mcycle$times
    x2= MASS::mcycle$accel
    X = cbind(x1, x2)
    results4_nomiss = BayesTreePrior(.95,.5, data.frame(X), minpart=5, package="tgp")
    #Case 4 : General case, with missing data
    x1[sample(1:length(x1), 20)] <- NA
    x2[sample(1:length(x2), 20)] <- NA
    X = cbind(x1, x2)
    results4_miss = BayesTreePrior(.95,.5, data.frame(X), minpart=5, package="tgp", 
    MIA=TRUE, missingdummy=TRUE)
}



