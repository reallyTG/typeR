library(funcy)


### Name: fpcCtrl-class
### Title: Class "fpcCtrl"
### Aliases: fpcCtrl-class fpcCtrl fpcCtrlMbc
### Keywords: classes

### ** Examples

##Have a look at the defaults
new("fpcCtrl")

##Coerce a list
mycont = list(select="automatic", sm1Dim="sm1", sm2Dim="sm2", nrMaxTime=20)
as(mycont, "fpcCtrl")

##Default values for coefficients calculation procedure
new("fpcCtrl")@coeffsCalc 



