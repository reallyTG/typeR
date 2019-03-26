library(oce)


### Name: errorbars
### Title: Draw error bars on an existing xy diagram
### Aliases: errorbars

### ** Examples


library(oce)
data(ctd)
S <- ctd[["salinity"]]
T <- ctd[["temperature"]]
plot(S, T)
errorbars(S, T, 0.05, 0.5)



