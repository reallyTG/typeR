library(LEGIT)


### Name: summary.IMLEGIT
### Title: Summarizing IMLEGIT fits
### Aliases: summary.IMLEGIT

### ** Examples

	train = example_2way(250, 1, seed=777)
fit_default = IMLEGIT(train$data, list(G=train$G, E=train$E), y ~ G*E)
summary(fit_default)



