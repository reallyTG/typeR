library(miWQS)


### Name: impute.univariate.bayesian.mi
### Title: Univariate Bayesian Multiple Imputation
### Aliases: impute.univariate.bayesian.mi
### Keywords: imputation

### ** Examples

# Example 1: 10% BDLs Example -------------------------
# Sample Dataset 87, using 10% BDL Scenario
data(simdata87)
set.seed(472195)
result.imputed <- impute.univariate.bayesian.mi(
   X = simdata87$X.bdl[ , 1:6], DL = simdata87$DL[1:6],
   T = 1000, n.burn = 50,  K = 2)
#Did the MCMC converge? A summary of Gelman Statistics is provided.
summary(result.imputed$convg.table)
#Summary of Impouted Values
apply(result.imputed$X.imputed, 2:3, summary)



