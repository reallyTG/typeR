library(MRsurv)


### Name: STR.data
### Title: These data were extracted from the DIVAT data bank for second
###   kidney transplant recipients.
### Aliases: STR.data
### Keywords: multiplicative regression relative survival partial
###   likelihood

### ** Examples


data(STR.data)

# The number of patients in the relative group.
dim(STR.data)

# Compute a Cox PH model
cox.STR<-coxph(Surv(Tps.Evt/365.24, Evt) ~ ageR2cl + Tattente2cl, data=STR.data)
summary(cox.STR)




