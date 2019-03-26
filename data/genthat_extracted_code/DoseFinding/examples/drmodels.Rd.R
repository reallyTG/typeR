library(DoseFinding)


### Name: DR-Models
### Title: Built-in dose-response models in DoseFinding
### Aliases: drmodels betaMod emax sigEmax exponential logistic linear
###   linlog quadratic linInt betaModGrad emaxGrad sigEmaxGrad
###   exponentialGrad logisticGrad linearGrad linlogGrad quadraticGrad
###   linIntGrad

### ** Examples

## some quadratic example shapes
quadModList <- Mods(quadratic = c(-0.5, -0.75, -0.85, -1), doses = c(0,1))
plot(quadModList)

## some emax example shapes
emaxModList <- Mods(emax = c(0.02,0.1,0.5,1), doses = c(0,1))
plot(emaxModList)
## example for gradient
emaxGrad(dose = (0:4)/4, eMax = 1, ed50 = 0.5)

## some sigmoid emax example shapes
sigEmaxModList <- Mods(sigEmax = rbind(c(0.05,1), c(0.15,3), c(0.4,8),
                       c(0.7,8)), doses = c(0,1))
plot(sigEmaxModList)
sigEmaxGrad(dose = (0:4)/4, eMax = 1, ed50 = 0.5, h = 8)

## some exponential example shapes
expoModList <- Mods(exponential = c(0.1,0.25,0.5,2), doses=c(0,1))
plot(expoModList)
exponentialGrad(dose = (0:4)/4, e1 = 1, delta = 2)

## some beta model example shapes
betaModList <- Mods(betaMod = rbind(c(1,1), c(1.5,0.75), c(0.8,2.5),
                    c(0.4,0.9)), doses=c(0,1), addArgs=list(scal = 1.2))
plot(betaModList)
betaModGrad(dose = (0:4)/4, eMax = 1, delta1 = 1, delta2 = 1, scal = 5)

## some logistic model example shapes
logistModList <- Mods(logistic = rbind(c(0.5,0.05), c(0.5,0.15),
                      c(0.2,0.05), c(0.2,0.15)), doses=c(0,1))
plot(logistModList)
logisticGrad(dose = (0:4)/4, eMax = 1, ed50 = 0.5, delta = 0.05)

## some linInt shapes
genModList <- Mods(linInt = rbind(c(0.5,1,1),
                      c(0,1,1), c(0,0,1)), doses=c(0,0.5,1,1.5))
plot(genModList)
linIntGrad(dose = (0:4)/4, resp=c(0,0.5,1,1,1), nodes=(0:4)/4)




