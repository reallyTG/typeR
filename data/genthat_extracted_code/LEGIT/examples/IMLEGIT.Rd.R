library(LEGIT)


### Name: IMLEGIT
### Title: Independent Multiple Latent Environmental & Genetic InTeraction
###   (IMLEGIT) model
### Aliases: IMLEGIT

### ** Examples

train = example_2way(500, 1, seed=777)
fit_best = IMLEGIT(train$data, list(G=train$G, E=train$E), y ~ G*E, 
list(train$coef_G, train$coef_E))
fit_default = IMLEGIT(train$data, list(G=train$G, E=train$E), y ~ G*E)
summary(fit_default)
summary(fit_best)
train = example_3way_3latent(500, 1, seed=777)
fit_best = IMLEGIT(train$data, train$latent_var, y ~ G*E*Z, 
list(train$coef_G, train$coef_E, train$coef_Z))
fit_default = IMLEGIT(train$data, train$latent_var, y ~ G*E*Z)
summary(fit_default)
summary(fit_best)



