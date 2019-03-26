library(simFrame)


### Name: NAControl-class
### Title: Class "NAControl"
### Aliases: NAControl-class NAControl getGrouping,NAControl-method
###   setGrouping,NAControl-method getAux,NAControl-method
###   setAux,NAControl-method getIntoContamination,NAControl-method
###   setIntoContamination,NAControl-method show,NAControl-method
###   NAcontrol-class naControl-class nacontrol-class NAcontrol naControl
###   nacontrol
### Keywords: classes

### ** Examples

data(eusilcP)
eusilcP$age[eusilcP$age < 0] <- 0  # this actually occurs
sam <- draw(eusilcP[, c("id", "age", "eqIncome")], size = 20)

## missing completely at random
mcarc <- NAControl(target = "eqIncome", NArate = 0.2)
setNA(sam, mcarc)

## missing at random
marc <- NAControl(target = "eqIncome", NArate = 0.2, aux = "age")
setNA(sam, marc)

## missing not at random
mnarc <- NAControl(target = "eqIncome", 
    NArate = 0.2, aux = "eqIncome")
setNA(sam, mnarc)



