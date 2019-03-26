library(ILS)


### Name: k.qcs
### Title: Function to calcute the Mandel's k statistic
### Aliases: k.qcs k.qcs.default k.qcs.lab.qcdata

### ** Examples


library(ILS)
data(Glucose)
Glucose.qcdata <- lab.qcdata(Glucose)
str(Glucose.qcdata)
k<- k.qcs(Glucose.qcdata, alpha = 0.005)
summary(k)
plot(k)



