library(rstpm2)


### Name: aft
### Title: Parametric accelerated failure time model with smooth time
###   functions
### Aliases: aft
### Keywords: survival smooth

### ** Examples

summary(aft(Surv(rectime,censrec==1)~hormon,data=brcancer,df=4))



