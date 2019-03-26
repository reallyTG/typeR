library(IPWsurvival)


### Name: DIVAT
### Title: A Sample From the DIVAT Data Bank of Kidney Transplant
###   Recipients.
### Aliases: DIVAT

### ** Examples


data(DIVAT)

# Compute the non-adjusted Cox PH model
cox.ECD0<-coxph(Surv(times, failures) ~ ecd, data=DIVAT)
summary(cox.ECD0) # Hazard Ratio = 1.97



