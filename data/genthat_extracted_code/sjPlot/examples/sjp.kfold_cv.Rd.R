library(sjPlot)


### Name: sjp.kfold_cv
### Title: Plot model fit from k-fold cross-validation
### Aliases: sjp.kfold_cv

### ** Examples

data(efc)

sjp.kfold_cv(efc, neg_c_7 ~ e42dep + c172code + c12hour)
sjp.kfold_cv(mtcars, mpg ~.)

# for poisson models. need to fit a model and use 'fit'-argument
fit <- glm(tot_sc_e ~ neg_c_7 + c172code, data = efc, family = poisson)
sjp.kfold_cv(efc, fit = fit)

# and for negative binomial models
fit <- MASS::glm.nb(tot_sc_e ~ neg_c_7 + c172code, data = efc)
sjp.kfold_cv(efc, fit = fit)




