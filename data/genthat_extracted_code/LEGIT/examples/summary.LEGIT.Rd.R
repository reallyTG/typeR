library(LEGIT)


### Name: summary.LEGIT
### Title: Summarizing LEGIT fits
### Aliases: summary.LEGIT

### ** Examples

	train = example_2way(250, 1, seed=777)
fit_default = LEGIT(train$data, train$G, train$E, y ~ G*E)
summary(fit_default)



