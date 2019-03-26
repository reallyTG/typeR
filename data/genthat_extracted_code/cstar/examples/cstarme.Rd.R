library(cstar)


### Name: cstarme
### Title: Compute cstar for simulated marginal effects
### Aliases: cstarme
### Keywords: sustantive significance regression

### ** Examples

# create some logit data
x <- rnorm(50)
xb <- .5 + 2*x
pry <- exp(xb) / (1 + exp(xb))
y <- rbinom(50, 1, pry)

plot(x, y)

# run logistic regression
mod <- glm(y~x, family=binomial(link="logit"))

# extract variance-covariance matrix
VCV <- vcov(mod)

# simulate intercept and B1 from multivariate normal
require(MASS)
simulated_betas <- mvrnorm(n=50, mu=coefficients(mod), Sigma=VCV)

# calculate pr(y=1) for each simulated pair of (intercept, B1);
# do so at x=0 and x=2
pry_x0 <- apply(simulated_betas, 1, function(x){
  exp(x[1] + 0*x[2]) / (1 + exp(x[1] + 0*x[2]))
  })
pry_x2 <- apply(simulated_betas, 1, function(x){
  exp(x[1] + 2*x[2]) / (1 + exp(x[1] + 2*x[2]))
})

# compute the simulated change in predicted probability
simulated_marginal_effects <- pry_x2 - pry_x0

# estimate the expected utility of accepting evidence
cstarme(simulated_marginal_effects, 2)



