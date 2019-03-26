library(multistate)


### Name: dataDIVAT
### Title: Sample of the DIVAT Cohort
### Aliases: dataDIVAT
### Keywords: dataset

### ** Examples

data(dataDIVAT)

### a description of transitions
table(dataDIVAT$trajectory)

### patient-graft survival (first event between the return to dialysis and the patient 
### death with a functioning graft)

dataDIVAT$failure<-1*(dataDIVAT$trajectory!=1 & dataDIVAT$trajectory!=12)

dataDIVAT$time<-NA
dataDIVAT$time<-ifelse(dataDIVAT$trajectory %in% c(1,12,13,14),
dataDIVAT$time1,dataDIVAT$time1+dataDIVAT$time2)

plot(survfit(Surv(time/365.24, failure) ~ 1 , data=dataDIVAT), mark.time=FALSE, 
      xlim=c(0,12), ylim=c(0,1), cex=1.5, col=1, lwd=2, lty=1, 
      xlab="Times after the transplantation (years)", 
      ylab="Patient-graft survival")




