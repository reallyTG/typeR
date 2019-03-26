library(pensim)


### Name: beer.survival
### Title: Survival data for Beer et al. (2002) lung adenocarcinoma study
### Aliases: beer.survival
### Keywords: datasets

### ** Examples

data(beer.survival)
library(survival)
surv.obj <- with(beer.survival, Surv(os, status))
surv.obj.rev <- with(beer.survival, Surv(os, 1-status))
survfit(surv.obj.rev~1)  #reverse KM estimate of follow-up time (months)
(my.survfit <- survfit(surv.obj~1))  ##KM estimate of survival
plot(my.survfit, xlab="Time (months)", 
     ylab="KM estimate of overall survival")
legend("bottomright", lty=c(1, 2), pch=-1,
       legend=c("KM estimate", "95 percent confidence interval"))



