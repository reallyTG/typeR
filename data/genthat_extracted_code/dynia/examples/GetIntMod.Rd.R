library(dynia)


### Name: GetIntMod
### Title: Find the intervention model with necessary covariates
### Aliases: GetIntMod
### Keywords: ts

### ** Examples

GetIntMod(delta=1.033,z=casualties[,1],T=70,xint=scale(casualties[,2]),itype="s",
 order=c(1,0,0),seasonal=list(order=c(0,0,1),period=12))



