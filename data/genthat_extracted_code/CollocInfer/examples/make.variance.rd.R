library(CollocInfer)


### Name: make.variance
### Title: Variance Functions
### Aliases: make.variance make.cvar make.var.SEIR

### ** Examples


# Multivariate normal observation of the state vector.

lik = make.multinorm()
lik$more = c(make.id(),make.cvar())




