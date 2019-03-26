library(lqmm)


### Name: boot
### Title: Bootstrap functions for LQM and LQMM
### Aliases: boot.lqm boot.lqmm boot
### Keywords: bootstrap standard errors

### ** Examples


# boot.lqm
set.seed(123)
n <- 500
test <- data.frame(x = runif(n,0,1))
test$y <- 30 + test$x + rnorm(n)
fit.lqm <- lqm(y ~ x, data = test, tau = 0.5)
fit.boot <- boot(fit.lqm)
str(fit.boot)

# boot.lqmm
data(Orthodont)
fit <- lqmm(distance ~ age, random = ~ 1, group = Subject,
	tau = 0.5, data = Orthodont)
fit.boot <- boot(fit)
str(fit.boot)



