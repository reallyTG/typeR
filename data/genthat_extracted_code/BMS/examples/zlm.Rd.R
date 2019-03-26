library(BMS)


### Name: zlm
### Title: Bayesian Linear Model with Zellner's g
### Aliases: zlm
### Keywords: models

### ** Examples


data(datafls)

#simple example
foo = zlm(datafls)
summary(foo)

#example with formula and subset
foo2 = zlm(y~GDP60+LifeExp, data=datafls, subset=2:70) #basic model, omitting three countries
summary(foo2)





