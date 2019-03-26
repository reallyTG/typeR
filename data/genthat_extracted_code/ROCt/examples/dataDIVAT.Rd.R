library(ROCt)


### Name: dataDIVAT
### Title: A Sample Of The DIVAT Cohort (Mortality).
### Aliases: dataDIVAT
### Keywords: dataset

### ** Examples

data(dataDIVAT)

### a short summary of the recipient age at the transplantation
summary(dataDIVAT$ageR)

### Kaplan and Meier estimation of the recipient survival
plot(survfit(Surv(death.time/365.25, death) ~ 1, data = dataDIVAT),
 xlab="Post transplantation time (in years)", ylab="Patient survival",
 mark.time=FALSE)



