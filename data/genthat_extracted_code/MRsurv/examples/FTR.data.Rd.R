library(MRsurv)


### Name: FTR.data
### Title: These data were extracted from the DIVAT data bank for first
###   kidney transplant recipients.
### Aliases: FTR.data
### Keywords: datasets first transplant recipients reference

### ** Examples


data(FTR.data)

# Compute a Cox PH model with both explicative variables
cox.FTR<-coxph(Surv(Tps.Evt/365.24, Evt) ~ ageR2cl + sexeR, data=FTR.data)
summary(cox.FTR)




