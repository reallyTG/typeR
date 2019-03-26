library(LEGIT)


### Name: LEGIT
### Title: Latent Environmental & Genetic InTeraction (LEGIT) model
### Aliases: LEGIT

### ** Examples

train = example_2way(500, 1, seed=777)
fit_best = LEGIT(train$data, train$G, train$E, y ~ G*E, train$coef_G, train$coef_E)
fit_default = LEGIT(train$data, train$G, train$E, y ~ G*E)
summary(fit_default)
summary(fit_best)
train = example_3way(500, 2.5, seed=777)
fit_best = LEGIT(train$data, train$G, train$E, y ~ G*E*z, train$coef_G, train$coef_E)
fit_default = LEGIT(train$data, train$G, train$E, y ~ G*E*z)
summary(fit_default)
summary(fit_best)



