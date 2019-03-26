library(DrBats)


### Name: postdens
### Title: Calculate the unnormalized posterior density of the model
### Aliases: postdens

### ** Examples

data("toydata")
data("stanfit")
dens <- postdens(coda.obj(stanfit), Y = toydata$Y.simul$Y, D = 2, chain = 1)
hist(dens)




