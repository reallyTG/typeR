library(BayesFM)


### Name: befa
### Title: Bayesian Exploratory Factor Analysis
### Aliases: befa

### ** Examples

#### model without covariates

set.seed(6)

# generate fake data with 15 manifest variables and 3 factors
N <- 200    # number of observations
Y <- simul.dedic.facmod(N, dedic = rep(1:3, each = 5))

# run MCMC sampler
# notice: 1000 MCMC iterations for illustration purposes only,
#  increase this number to obtain reliable posterior results!
mcmc <- befa(Y, Kmax = 5, iter = 1000)

# post process MCMC draws to restore identification
mcmc <- post.column.switch(mcmc)
mcmc <- post.sign.switch(mcmc)
## No test: 
summary(mcmc)  # summarize posterior results
plot(mcmc)     # plot posterior results

# summarize highest posterior probability (HPP) model
summary(mcmc, what = 'hppm')

#### model with covariates

# generate covariates and regression coefficients
Xcov <- cbind(1, matrix(rnorm(4*N), ncol = 4))
colnames(Xcov) <- c('(Intercept)', paste0('X', 1:4))
beta <- rbind(rnorm(15), rnorm(15), diag(3) %x% t(rnorm(5)))

# add covariates to previous model
Y <- Y + Xcov %*% beta

# specify model
model <- c('~ X1',                        # X1 covariate in all equations
           paste0('Y', 1:5,   ' ~ X2'),   # X2 covariate for Y1-Y5 only
           paste0('Y', 6:10,  ' ~ X3'),   # X3 covariate for Y6-Y10 only
           paste0('Y', 11:15, ' ~ X4'))   # X4 covariate for Y11-Y15 only
model <- lapply(model, as.formula)        # make list of formulas

# run MCMC sampler, post process and summarize
mcmc <- befa(model, data = data.frame(Y, Xcov), Kmax = 5, iter = 1000)
mcmc <- post.column.switch(mcmc)
mcmc <- post.sign.switch(mcmc)
mcmc.sum <- summary(mcmc)
mcmc.sum

# compare posterior mean of regression coefficients to true values
beta.comp <- cbind(beta[beta != 0], mcmc.sum$beta[, 'mean'])
colnames(beta.comp) <- c('true', 'mcmc')
print(beta.comp, digits = 3)
## End(No test)




