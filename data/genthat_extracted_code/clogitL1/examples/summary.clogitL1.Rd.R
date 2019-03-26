library(clogitL1)


### Name: summary.clogitL1
### Title: Summary after fitting conditional logistic regression with
###   elastic net penalties
### Aliases: summary.clogitL1

### ** Examples

set.seed(145)

# data parameters
K = 10 # number of strata
n = 5 # number in strata
m = 2 # cases per stratum
p = 20 # predictors

# generate data
y = rep(c(rep(1, m), rep(0, n-m)), K)
X = matrix (rnorm(K*n*p, 0, 1), ncol = p) # pure noise
strata = sort(rep(1:K, n))

par(mfrow = c(1,2))
# fit the conditional logistic model
clObj = clogitL1(y=y, x=X, strata)
summary(clObj)



