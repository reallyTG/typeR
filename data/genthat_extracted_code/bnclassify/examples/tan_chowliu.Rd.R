library(bnclassify)


### Name: tan_chowliu
### Title: Learns a one-dependence estimator using Chow-Liu's algorithm.
### Aliases: tan_chowliu tan_cl

### ** Examples

data(car)
ll <- tan_cl('class', car, score = 'loglik')   
## Not run: plot(ll)
ll <- tan_cl('class', car, score = 'loglik', root = 'maint')   
## Not run: plot(ll)
aic <- tan_cl('class', car, score = 'aic')   
bic <- tan_cl('class', car, score = 'bic')   



