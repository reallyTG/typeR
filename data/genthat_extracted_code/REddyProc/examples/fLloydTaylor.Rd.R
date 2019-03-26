library(REddyProc)


### Name: fLloydTaylor
### Title: Temperature dependence of soil respiration
### Aliases: fLloydTaylor

### ** Examples

  T <- c(-10:30)
resp <- fLloydTaylor(10, 330, T + 273.15)
plot(resp ~ T)



