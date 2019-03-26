library(bnclassify)


### Name: bnc
### Title: Learn network structure and parameters.
### Aliases: bnc

### ** Examples

data(car)
nb <- bnc('nb', 'class', car, smooth = 1)
nb_manb <- bnc('nb', 'class', car, smooth = 1, manb_prior = 0.3)
ode_cl_aic <- bnc('tan_cl', 'class', car, smooth = 1, dag_args = list(score = 'aic'))



