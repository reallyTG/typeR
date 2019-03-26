library(mme)


### Name: initial.values
### Title: Initial values for fitting algorithm to estimate the fixed and
###   random effects and the variance components
### Aliases: initial.values
### Keywords: models

### ** Examples

k=3 #number of categories of the response variable
pp=c(1,1) #vector with the number of auxiliary variables in each category
data(simdata)
D=nrow(simdata)
mod=1 #Type of model
datar=data.mme(simdata,k,pp,mod)

## Initial values for fixed, random effects and variance components
initial=datar$initial



