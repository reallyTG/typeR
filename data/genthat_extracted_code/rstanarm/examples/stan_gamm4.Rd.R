library(rstanarm)


### Name: stan_gamm4
### Title: Bayesian generalized linear additive models with optional
###   group-specific terms via Stan
### Aliases: stan_gamm4 plot_nonlinear

### ** Examples

# from example(gamm4, package = "gamm4"), prefixing gamm4() call with stan_
## No test: 
dat <- mgcv::gamSim(1, n = 400, scale = 2) ## simulate 4 term additive truth
## Now add 20 level random effect `fac'...
dat$fac <- fac <- as.factor(sample(1:20, 400, replace = TRUE))
dat$y <- dat$y + model.matrix(~ fac - 1) %*% rnorm(20) * .5

br <- stan_gamm4(y ~ s(x0) + x1 + s(x2), data = dat, random = ~ (1 | fac), 
                 chains = 1, iter = 200) # for example speed
print(br)
plot_nonlinear(br)
plot_nonlinear(br, smooths = "s(x0)", alpha = 2/3)
## End(No test)




