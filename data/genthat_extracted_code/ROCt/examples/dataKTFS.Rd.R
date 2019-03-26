library(ROCt)


### Name: dataKTFS
### Title: A Sample Of The DIVAT cohort (Kidney Transplant Failure Score,
###   KTFS).
### Aliases: dataKTFS
### Keywords: dataset

### ** Examples

data(dataKTFS)

### a short summary of the recipient age at the transplantation
summary(dataKTFS$score)

### Kaplan and Meier estimation of the recipient survival
plot(survfit(Surv(time, failure) ~ I(score>4.17), data = dataKTFS),
 xlab="Post transplantation time (in years)", ylab="Patient survival",
 mark.time=FALSE, col=c(2,1), lty=c(2,1))
 
legend("bottomleft", c("Recipients in the high-risk group",
 "Recipients in the low-risk group"), col=1:2, lty=1:2)



