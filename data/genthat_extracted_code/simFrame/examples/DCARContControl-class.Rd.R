library(simFrame)


### Name: DCARContControl-class
### Title: Class "DCARContControl"
### Aliases: DCARContControl-class DCARContControl
###   getDistribution,DCARContControl-method
###   setDistribution,DCARContControl-method getDots,DCARContControl-method
###   setDots,DCARContControl-method DCARcontControl DCARcontcontrol
###   DCARContcontrol DCARcontControl-class DCARcontcontrol-class
###   DCARContcontrol-class dcarcontControl dcarcontcontrol dcarContcontrol
###   dcarcontControl-class dcarcontcontrol-class dcarContcontrol-class
### Keywords: classes

### ** Examples

data(eusilcP)
sam <- draw(eusilcP[, c("id", "eqIncome")], size = 20)
cc <- DCARContControl(target = "eqIncome", epsilon = 0.05, 
    dots = list(mean = 5e+05, sd = 10000))
contaminate(sam, cc)



