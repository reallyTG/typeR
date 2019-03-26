library(actuar)


### Name: cm
### Title: Credibility Models
### Aliases: cm print.cm predict.cm summary.cm print.summary.cm
### Keywords: models

### ** Examples

data(hachemeister)

## Buhlmann-Straub model
fit <- cm(~state, hachemeister,
          ratios = ratio.1:ratio.12, weights = weight.1:weight.12)
fit				# print method
predict(fit)			# credibility premiums
summary(fit)			# more details

## Two-level hierarchical model. Notice that data does not have
## to be sorted by level
X <- data.frame(unit = c("A", "B", "A", "B", "B"), hachemeister)
fit <- cm(~unit + unit:state, X, ratio.1:ratio.12, weight.1:weight.12)
predict(fit)
predict(fit, levels = "unit")	# unit credibility premiums only
summary(fit)
summary(fit, levels = "unit")	# unit summaries only

## Regression model with intercept at time origin
fit <- cm(~state, hachemeister,
          regformula = ~time, regdata = data.frame(time = 12:1),
          ratios = ratio.1:ratio.12, weights = weight.1:weight.12)
fit
predict(fit, newdata = data.frame(time = 0))
summary(fit, newdata = data.frame(time = 0))

## Same regression model, with intercept at barycenter of time
fit <- cm(~state, hachemeister, adj.intercept = TRUE,
          regformula = ~time, regdata = data.frame(time = 12:1),
          ratios = ratio.1:ratio.12, weights = weight.1:weight.12)
fit
predict(fit, newdata = data.frame(time = 0))
summary(fit, newdata = data.frame(time = 0))

## Poisson/Gamma pure Bayesian model
fit <- cm("bayes", data = c(5, 3, 0, 1, 1),
          likelihood = "poisson", shape = 3, rate = 3)
fit
predict(fit)
summary(fit)

## Normal/Normal pure Bayesian model
cm("bayes", data = c(5, 3, 0, 1, 1),
   likelihood = "normal", sd.lik = 2,
   mean = 2, sd = 1)



