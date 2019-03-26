library(rstanarm)


### Name: predictive_error.stanreg
### Title: In-sample or out-of-sample predictive errors
### Aliases: predictive_error.stanreg predictive_error predictive_error.ppd

### ** Examples

if (!exists("example_model")) example(example_model)
err1 <- predictive_error(example_model, draws = 50)
hist(err1)

# Using newdata with a binomial model
formula(example_model)
nd <- data.frame(
 size = c(10, 20), 
 incidence = c(5, 10), 
 period = factor(c(1,2)), 
 herd = c(1, 15)
)
err2 <- predictive_error(example_model, newdata = nd, draws = 10, seed = 1234)

# stanreg vs ppd methods
fit <- stan_glm(mpg ~ wt, data = mtcars, iter = 300)
preds <- posterior_predict(fit, seed = 123)
all.equal(
  predictive_error(fit, seed = 123),
  predictive_error(preds, y = fit$y)
)




