library(lqmm)


### Name: extractBoot
### Title: Extract Fixed and Random Bootstrapped Parameters
### Aliases: extractBoot.boot.lqmm extractBoot
### Keywords: bootstrap

### ** Examples


## Orthodont data
data(Orthodont)

# Random intercept model
fit <- lqmm(distance ~ age, random = ~ 1, group = Subject,
	tau = 0.5, data = Orthodont)
fit.boot <- boot(fit)

# extract fixed effects
B <- extractBoot(fit.boot, which = "fixed")

# covariance matrix estimated fixed parameters
cov(B)




