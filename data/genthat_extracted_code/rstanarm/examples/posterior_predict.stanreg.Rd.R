library(rstanarm)


### Name: posterior_predict.stanreg
### Title: Draw from posterior predictive distribution
### Aliases: posterior_predict.stanreg posterior_predict
###   posterior_predict.stanmvreg

### ** Examples

if (!exists("example_model")) example(example_model)
yrep <- posterior_predict(example_model)
table(yrep)

## No test: 
# Using newdata
counts <- c(18,17,15,20,10,20,25,13,12)
outcome <- gl(3,1,9)
treatment <- gl(3,3)
fit3 <- stan_glm(counts ~ outcome + treatment, family = poisson(link="log"),
                prior = normal(0, 1), prior_intercept = normal(0, 5))
nd <- data.frame(treatment = factor(rep(1,3)), outcome = factor(1:3))
ytilde <- posterior_predict(fit3, nd, draws = 500)
print(dim(ytilde))  # 500 by 3 matrix (draws by nrow(nd))
ytilde <- data.frame(count = c(ytilde),
                     outcome = rep(nd$outcome, each = 500))
ggplot2::ggplot(ytilde, ggplot2::aes(x=outcome, y=count)) +
  ggplot2::geom_boxplot() +
  ggplot2::ylab("predicted count")


# Using newdata with a binomial model.
# example_model is binomial so we need to set
# the number of trials to use for prediction.
# This could be a different number for each
# row of newdata or the same for all rows.
# Here we'll use the same value for all.
nd <- lme4::cbpp
print(formula(example_model))  # cbind(incidence, size - incidence) ~ ...
nd$size <- max(nd$size) + 1L   # number of trials
nd$incidence <- 0  # set to 0 so size - incidence = number of trials
ytilde <- posterior_predict(example_model, newdata = nd)


# Using fun argument to transform predictions
mtcars2 <- mtcars
mtcars2$log_mpg <- log(mtcars2$mpg)
fit <- stan_glm(log_mpg ~ wt, data = mtcars2)
ytilde <- posterior_predict(fit, fun = exp)
## End(No test)




