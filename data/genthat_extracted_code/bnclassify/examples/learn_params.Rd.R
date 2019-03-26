library(bnclassify)


### Name: learn_params
### Title: Learn the parameters of a Bayesian network structure.
### Aliases: learn_params lp

### ** Examples

data(car)
nb <- nb('class', car)
# Maximum likelihood estimation
mle <- lp(nb, car, smooth = 0)
# Bayesian estimaion
bayes <- lp(nb, car, smooth = 0.5)
# MANB
manb <- lp(nb, car, smooth = 0.5, manb_prior = 0.5)
# AWNB
awnb <- lp(nb, car, smooth = 0.5, awnb_trees = 10)



