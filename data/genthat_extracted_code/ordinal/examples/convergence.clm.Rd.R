library(ordinal)


### Name: convergence
### Title: Check convergence of cumulative link models
### Aliases: convergence convergence.clm print.convergence.clm
### Keywords: models

### ** Examples


## Simple model:
fm1 <- clm(rating ~ contact + temp, data=wine)
summary(fm1)
convergence(fm1)




