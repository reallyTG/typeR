library(lifecontingencies)


### Name: mdt-class
### Title: Class '"mdt"'
### Aliases: mdt-class getDecrements,mdt-method getOmega,mdt-method
###   initialize,mdt-method print,mdt-method coerce,mdt,data.frame-method
###   coerce,mdt,markovchainList-method show,mdt-method summary,mdt-method
### Keywords: classes

### ** Examples
#shows the class definition
showClass("mdt")
#create a new table
tableDecr=data.frame(d1=c(150,160,160),d2=c(50,75,85))
newMdt<-new("mdt",name="testMDT",table=tableDecr)



