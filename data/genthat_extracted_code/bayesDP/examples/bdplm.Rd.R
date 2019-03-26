library(bayesDP)


### Name: bdplm
### Title: Bayesian Discount Prior: Two-Arm Linear Regression
### Aliases: bdplm bdplm,ANY-method

### ** Examples

# Set sample sizes
n_t  <- 30     # Current treatment sample size
n_c  <- 30     # Current control sample size
n_t0 <- 80     # Historical treatment sample size
n_c0 <- 80     # Historical control sample size

# Treatment group vectors for current and historical data
treatment   <- c(rep(1,n_t), rep(0,n_c))
treatment0  <- c(rep(1,n_t0), rep(0,n_c0))

# Simulate a covariate effect for current and historical data
x  <- rnorm(n_t+n_c, 1, 5)
x0 <- rnorm(n_t0+n_c0, 1, 5)

# Simulate outcome:
# - Intercept of 10 for current and historical data
# - Treatment effect of 31 for current data
# - Treatment effect of 30 for historical data
# - Covariate effect of 3 for current and historical data
Y  <- 10 + 31*treatment  + x*3 + rnorm(n_t+n_c,0,5)
Y0 <- 10 + 30*treatment0 + x0*3 + rnorm(n_t0+n_c0,0,5)

# Place data into separate treatment and control data frames and
# assign historical = 0 (current) or historical = 1 (historical)
df_ <- data.frame(Y=Y, treatment=treatment, x=x)
df0 <- data.frame(Y=Y0, treatment=treatment0, x=x0)

# Fit model using default settings
fit <- bdplm(formula=Y ~ treatment+x, data=df_, data0=df0,
             method="fixed")

# Look at estimates and discount weight
summary(fit)
print(fit)




