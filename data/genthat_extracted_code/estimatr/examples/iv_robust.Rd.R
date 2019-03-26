library(estimatr)


### Name: iv_robust
### Title: Two-Stage Least Squares Instrumental Variables Regression
### Aliases: iv_robust

### ** Examples

library(fabricatr)
dat <- fabricate(
  N = 40,
  Y = rpois(N, lambda = 4),
  Z = rbinom(N, 1, prob = 0.4),
  D  = Z * rbinom(N, 1, prob = 0.8),
  X = rnorm(N),
  G = sample(letters[1:4], N, replace = TRUE)
)

# Instrument for treatment `D` with encouragement `Z`
tidy(iv_robust(Y ~ D + X | Z + X, data = dat))

# Instrument with Stata's `ivregress 2sls , small rob` HC1 variance
tidy(iv_robust(Y ~ D | Z, data = dat, se_type = "stata"))

# With clusters, we use CR2 errors by default
dat$cl <- rep(letters[1:5], length.out = nrow(dat))
tidy(iv_robust(Y ~ D | Z, data = dat, clusters = cl))

# Again, easy to replicate Stata (again with `small` correction in Stata)
tidy(iv_robust(Y ~ D | Z, data = dat, clusters = cl, se_type = "stata"))

# We can also specify fixed effects, that will be taken as exogenous regressors
# Speed gains with fixed effects are greatests with "stata" or "HC1" std.errors
tidy(iv_robust(Y ~ D | Z, data = dat, fixed_effects = ~ G, se_type = "HC1"))




