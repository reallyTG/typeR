library(FDboost)


### Name: bbsc
### Title: Constrained Base-learners for Scalar Covariates
### Aliases: bbsc brandomc bolsc bolsc brandomc
### Keywords: models

### ** Examples

#### simulate data with functional response and scalar covariate (functional ANOVA)
n <- 60   ## number of cases
Gy <- 27  ## number of observation poionts per response curve 
dat <- list()
dat$t <- (1:Gy-1)^2/(Gy-1)^2
set.seed(123)
dat$z1 <- rep(c(-1, 1), length = n)
dat$z1_fac <- factor(dat$z1, levels = c(-1, 1), labels = c("1", "2"))
# dat$z1 <- runif(n)
# dat$z1 <- dat$z1 - mean(dat$z1)

# mean and standard deviation for the functional response 
mut <- matrix(2*sin(pi*dat$t), ncol = Gy, nrow = n, byrow = TRUE) + 
        outer(dat$z1, dat$t, function(z1, t) z1*cos(pi*t) ) # true linear predictor
sigma <- 0.1

# draw respone y_i(t) ~ N(mu_i(t), sigma)
dat$y <- apply(mut, 2, function(x) rnorm(mean = x, sd = sigma, n = n)) 

## fit function-on-scalar model with a linear effect of z1
m1 <- FDboost(y ~ 1 + bolsc(z1_fac, df = 1), timeformula = ~ bbs(t, df = 6), data = dat)

# look for optimal mSTOP using cvrisk() or validateFDboost()
 ## Not run: 
##D cvm <- cvrisk(m1, grid = 1:500)
##D m1[mstop(cvm)]
## End(Not run)
m1[200] # use 200 boosting iterations 

# plot true and estimated coefficients 
plot(dat$t, 2*sin(pi*dat$t), col = 2, type = "l", main = "intercept")
plot(m1, which = 1, lty = 2, add = TRUE)

plot(dat$t, 1*cos(pi*dat$t), col = 2, type = "l", main = "effect of z1")
lines(dat$t, -1*cos(pi*dat$t), col = 2, type = "l")
plot(m1, which = 2, lty = 2, col = 1, add = TRUE)





