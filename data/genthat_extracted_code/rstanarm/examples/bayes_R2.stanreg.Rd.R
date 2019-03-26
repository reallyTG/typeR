library(rstanarm)


### Name: bayes_R2.stanreg
### Title: Compute a Bayesian version of R-squared for regression models
### Aliases: bayes_R2.stanreg bayes_R2

### ** Examples

fit <- stan_glm(mpg ~ wt + cyl, data = mtcars, QR = TRUE, chains = 2)
rsq <- bayes_R2(fit)
print(median(rsq))

# specifying newdata (including outcome variable 'mpg')
nd <- data.frame(mpg = c(10, 20, 30), wt = c(4, 3, 2), cyl = c(8, 6, 4))
rsq_new <- bayes_R2(fit, newdata = nd)
print(median(rsq_new))

# multilevel binomial model
if (!exists("example_model")) example(example_model)
print(example_model)
median(bayes_R2(example_model))
median(bayes_R2(example_model, re.form = NA)) # exclude group-level




