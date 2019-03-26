library(bayesdistreg)


### Name: posterior
### Title: Posterior distribution
### Aliases: posterior

### ** Examples

y = indicat(faithful$waiting,mean(faithful$waiting)) 
x = scale(cbind(faithful$eruptions,faithful$eruptions^2))
data = data.frame(y,x)
posterior(rep(0,3),data,Log = FALSE,mu=0,sig = 10,prior = "Normal") # no log
posterior(rep(0,3),data,Log = TRUE,mu=0,sig = 10,prior = "Normal") # log
posterior(rep(0,3),data,Log = TRUE) # use default values




