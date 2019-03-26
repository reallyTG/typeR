library(icenReg)


### Name: cs2ic
### Title: Convert current status data into interval censored format
### Aliases: cs2ic

### ** Examples


simData <- simCS_weib()
# Simulate current status data

head(cs2ic(simData$time, simData$event))
# Converting data to current status format

fit <- ic_par(cs2ic(time, event) ~ x1 + x2, data = simData)
# Can be used directly in formula




