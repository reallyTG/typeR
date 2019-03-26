library(mlogitBMA)


### Name: bic.mlogit
### Title: Bayesian Model Averaging for Multinomial Logit Models
### Aliases: bic.mlogit
### Keywords: regression models classes

### ** Examples

data('heating')
res <- bic.mlogit(depvar ~ ic + oc + income + rooms, heating, choices=1:5, 
                  varying=3:12, verbose=TRUE, approx=FALSE, sep='')
summary(res)
imageplot.mlogit(res)
plot(res)

# use approximate BMA and estimate the models afterwards
res <- bic.mlogit(depvar ~ ic + oc | income + rooms, heating, choices=1:5, 
                  varying=3:12, verbose=TRUE, approx=TRUE, sep='')
summary(res)
estimate.mlogit(res, heating)



