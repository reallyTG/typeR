library(bnclassify)


### Name: inspect_bnc_bn
### Title: Inspect a Bayesian network classifier (with structure and
###   parameters).
### Aliases: inspect_bnc_bn nparams manb_arc_posterior awnb_weights params
###   values classes

### ** Examples

 
data(car)
nb <- bnc('nb', 'class', car, smooth = 1)
nparams(nb)
nb <- bnc('nb', 'class', car, smooth = 1, manb_prior = 0.5)
manb_arc_posterior(nb)
nb <- bnc('nb', 'class', car, smooth = 1, awnb_bootstrap = 0.5)
awnb_weights(nb)



