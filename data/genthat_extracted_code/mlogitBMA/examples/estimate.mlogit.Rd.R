library(mlogitBMA)


### Name: estimate.mlogit
### Title: Multinomial Logit Estimation
### Aliases: estimate.mlogit estimate.mlogit.formula
###   estimate.mlogit.mnl.spec estimate.mlogit.bic.mlogit
###   estimate.mlogit.list mnl
### Keywords: optimize htest classes

### ** Examples

data(heating)
est <- estimate.mlogit(depvar ~ ic + oc, heating, choices=1:5, 
                       varying=c(3:12, 20:24), sep='')
summary(est)



