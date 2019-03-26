library(ILS)


### Name: h.qcs
### Title: Function to estimate the univariate Mandel's h statistic
### Aliases: h.qcs h.qcs.default h.qcs.lab.qcdata

### ** Examples


library(ILS)
data(Glucose)
Glucose.qcdata <- lab.qcdata(Glucose)
str(Glucose.qcdata)
h<- h.qcs(Glucose.qcdata, alpha = 0.005)
summary(h)
plot(h)



