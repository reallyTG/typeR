library(mvMISE)


### Name: mvMISE_e
### Title: A multivariate mixed-effects selection model with correlated
###   outcome-specific error terms
### Aliases: mvMISE_e

### ** Examples

data(sim_dat)

# Covariates X common across outcomes with common coefficients

fit0 = mvMISE_e(Y = sim_dat$Y, X = sim_dat$X, id = sim_dat$id)

## No test: 

# In the example below, we showed how to estimate outcome-specific
# coefficients for a common covariate. The second column of
# sim_dat$X matrix is a common covariate. But it has different
# effects/coefficients on different outcomes.

nY = ncol(sim_dat$Y)
# stack X across outcomes
X_mat = sim_dat$X[rep(1:nrow(sim_dat$X), nY), ]
# Y_ind is the indicator matrix corresponding to different outcomes
Y_ind = kronecker(diag(nY), rep(1, nrow(sim_dat$Y)))
# generate outcome-specific covariates
cidx = 2  # the index for the covariate with outcome-specific coefficient
X_mat = cbind(1, X_mat[, cidx] * Y_ind)

# X_mat is a matrix of 460 (92*5) by 6, the first column is
# intercept and the next 5 columns are covariate for each outcome

fit1 = mvMISE_e(Y = sim_dat$Y, X = X_mat, id = sim_dat$id)


# A covariate only specific to the first outcome

X_mat1 = X_mat[, 1:2]

fit2 = mvMISE_e(Y = sim_dat$Y, X = X_mat1, id = sim_dat$id)


## An example to allow missingness to depend on both a covariate and
## the outcome

fit3 = mvMISE_e(Y = sim_dat$Y, X = sim_dat$X, id = sim_dat$id, 
    cov_miss = sim_dat$X[, 2])

## End(No test)



