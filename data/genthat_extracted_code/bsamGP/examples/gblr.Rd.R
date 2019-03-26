library(bsamGP)


### Name: gblr
### Title: Generalized Bayesian Linear Models
### Aliases: gblr
### Keywords: generalized linear model parametric model

### ** Examples

############################
# Poisson Regression Model #
############################

# Simulate data
set.seed(1)

n <- 100
x <- runif(n)
y <- rpois(n, exp(0.5 + x*0.4))

# Fit the model with default priors and mcmc parameters
fout <- gblr(y ~ x, family = 'poisson', link = 'log')

# Summary
print(fout); summary(fout)

# Plot
plot(fout)

# fitted values
fitf <- fitted(fout)



