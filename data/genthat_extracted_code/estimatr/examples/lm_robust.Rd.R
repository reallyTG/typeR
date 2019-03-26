library(estimatr)


### Name: lm_robust
### Title: Ordinary Least Squares with Robust Standard Errors
### Aliases: lm_robust

### ** Examples

library(fabricatr)
dat <- fabricate(
  N = 40,
  y = rpois(N, lambda = 4),
  x = rnorm(N),
  z = rbinom(N, 1, prob = 0.4)
)

# Default variance estimator is HC2 robust standard errors
lmro <- lm_robust(y ~ x + z, data = dat)

# Can tidy() the data in to a data.frame
tidy(lmro)
# Can use summary() to get more statistics
summary(lmro)
# Can also get coefficients three ways
lmro$coefficients
coef(lmro)
tidy(lmro)$estimate
# Can also get confidence intervals from object or with new 1 - `alpha`
lmro$conf.low
confint(lmro, level = 0.8)

# Can recover classical standard errors
lmclassic <- lm_robust(y ~ x + z, data = dat, se_type = "classical")
tidy(lmclassic)

# Can easily match Stata's robust standard errors
lmstata <- lm_robust(y ~ x + z, data = dat, se_type = "stata")
tidy(lmstata)

# Easy to specify clusters for cluster-robust inference
dat$clusterID <- sample(1:10, size = 40, replace = TRUE)

lmclust <- lm_robust(y ~ x + z, data = dat, clusters = clusterID)
tidy(lmclust)

# Can also match Stata's clustered standard errors
lm_robust(
  y ~ x + z,
  data = dat,
  clusters = clusterID,
  se_type = "stata"
)

# Works just as LM does with functions in the formula
dat$blockID <- rep(c("A", "B", "C", "D"), each = 10)

lm_robust(y ~ x + z + factor(blockID), data = dat)

# Weights are also easily specified
dat$w <- runif(40)

lm_robust(
  y ~ x + z,
  data = dat,
  weights = w,
  clusters = clusterID
)

# Subsetting works just as in `lm()`
lm_robust(y ~ x, data = dat, subset = z == 1)

# One can also choose to set the significance level for different CIs
lm_robust(y ~ x + z, data = dat, alpha = 0.1)

# We can also specify fixed effects
# Speed gains with fixed effects are greatests with "stata" or "HC1" std.errors
tidy(lm_robust(y ~ x + z, data = dat, fixed_effects = ~ blockID, se_type = "HC1"))

## Not run: 
##D   # Can also use 'margins' package if you have it installed to get
##D   # marginal effects
##D   library(margins)
##D   lmrout <- lm_robust(y ~ x + z, data = dat)
##D   summary(margins(lmrout))
##D 
##D   # Can output results using 'texreg'
##D   library(texreg)
##D   texreg(lmrout)
## End(Not run)




