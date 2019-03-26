library(BayesMAMS)


### Name: ssbayes
### Title: Bayesian Sample Size Calculation for Multi-Arm Studies
### Aliases: ssbayes
### Keywords: ~design

### ** Examples

### Known precision (example from Section 3 of Whitehead et al. 2015)

# Criterion 1
ssbayes(k=2, nu=1, q0=c(16, 4, 4), eta=0.95, zeta=0.90, deltastar=0.5, prec="known", crit="1")

# Criterion 2
ssbayes(k=2, nu=1, q0=c(16, 4, 4), eta=0.95, zeta=0.90, deltastar=0.5, prec="known", crit="2")

### Unknown precision (example from Section 5 of Whitehead et al. 2015)

# Criterion 1
ssbayes(k=4, q0=c(10, rep(2, 4)), eta=0.95, zeta=0.90, deltastar=5, alpha0=1, beta0=49, xi=0.95,
        prec="unknown", crit="1")

# Criterion 2
ssbayes(k=4, q0=c(10, rep(2, 4)), eta=0.95, zeta=0.90, deltastar=5, alpha0=1, beta0=49, xi=0.95,
        prec="unknown", crit="2")



