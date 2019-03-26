library(rstanarm)


### Name: predictive_interval.stanreg
### Title: Predictive intervals
### Aliases: predictive_interval.stanreg predictive_interval
###   predictive_interval.ppd

### ** Examples

fit <- stan_glm(mpg ~ wt, data = mtcars, iter = 300)
predictive_interval(fit)
predictive_interval(fit, newdata = data.frame(wt = range(mtcars$wt)), 
                    prob = 0.5)

# stanreg vs ppd methods
preds <- posterior_predict(fit, seed = 123)
all.equal(
  predictive_interval(fit, seed = 123),
  predictive_interval(preds)
)




