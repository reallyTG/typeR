library(icenReg)


### Name: simCS_weib
### Title: Simulate Current Status Data
### Aliases: simCS_weib

### ** Examples

simData <- simCS_weib()
fit <- ic_par(cs2ic(time, event) ~ x1 + x2, data = simData)



