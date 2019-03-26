library(CarletonStats)


### Name: bootCor
### Title: Bootstrap the correlation
### Aliases: bootCor bootCor.default bootCor.formula
### Keywords: randomiziation resampling

### ** Examples



plot(states03$ColGrad, states03$InfMortality)
bootCor(InfMortality ~ ColGrad, data = states03)
bootCor(states03$ColGrad, states03$InfMortality)




