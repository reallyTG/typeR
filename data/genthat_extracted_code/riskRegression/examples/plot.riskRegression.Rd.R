library(riskRegression)


### Name: plot.riskRegression
### Title: Plotting predicted risk
### Aliases: plot.riskRegression
### Keywords: survival

### ** Examples


library(survival)
data(Melanoma)
fit.arr <- ARR(Hist(time,status)~invasion+age+strata(sex),data=Melanoma,cause=1)
plot(fit.arr,xlim=c(500,3000))





