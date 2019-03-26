library(rstanarm)


### Name: stan_aov
### Title: Bayesian regularized linear models via Stan
### Aliases: stan_aov stan_lm stan_lm.wfit stan_lm.fit

### ** Examples

## No test: 
op <- options(contrasts = c("contr.helmert", "contr.poly"))
fit_aov <- stan_aov(yield ~ block + N*P*K, data = npk,
         prior = R2(0.5), seed = 12345)
options(op)
print(fit_aov)
## End(No test)
            
(fit <- stan_lm(mpg ~ wt + qsec + am, data = mtcars, prior = R2(0.75), 
                # the next line is only to make the example go fast enough
                chains = 1, iter = 500, seed = 12345))
plot(fit, prob = 0.8)
plot(fit, "hist", pars = c("wt", "am", "qsec", "sigma"), 
     transformations = list(sigma = "log"))




