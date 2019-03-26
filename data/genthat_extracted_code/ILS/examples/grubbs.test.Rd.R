library(ILS)


### Name: grubbs.test
### Title: Function to compute the Grubbs test statistic.
### Aliases: grubbs.test grubbs.test.default grubbs.test.lab.qcdata

### ** Examples


library(ILS)
data(Glucose)
Glucose.qcdata<- lab.qcdata(Glucose)
str(Glucose.qcdata)
grubbs.test(Glucose.qcdata)



