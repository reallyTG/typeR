library(tcpl)


### Name: tcplFit
### Title: Fit the data with the constant, hill, and gain-loss models
### Aliases: tcplFit

### ** Examples

logc <- 1:10
resp <- sapply(1:10, tcplHillVal, ga = 5, tp = 50, gw = 0.5)
params <- tcplFit(logc = logc, resp = resp, bmad = 10)
plot(resp ~ logc)
tcplAddModel(pars = params, modl = "hill")




