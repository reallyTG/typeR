library(texmex)


### Name: evm
### Title: Extreme value modelling
### Aliases: evm evm.default
### Keywords: models

### ** Examples


  mod <- evm(rain, th=30)
  mod
  par(mfrow=c(2, 2))
  plot(mod)

  ## No test: 
  mod <- evm(rain, th=30, method="sim")
  par(mfrow=c(3, 2))
  plot(mod)
  
## End(No test)

  mod <- evm(SeaLevel, data=portpirie, family=gev)
  mod
  plot(mod)

  ## No test: 
  mod <- evm(SeaLevel, data=portpirie, family=gev, method="sim")
  par(mfrow=c(3, 3))
  plot(mod)
  
## End(No test)




