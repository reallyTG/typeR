library(gte)


### Name: simul
### Title: Simulated Data
### Aliases: simul
### Keywords: datasets

### ** Examples

data(simul)
Fit <- gte(Surv(L, R, type="interval2") ~ Z, data=simul, z=15)
plot(Fit)



