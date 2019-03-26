library(ILS)


### Name: cochran.test
### Title: Function to compute the Grubbs test statistic.
### Aliases: cochran.test cochran.test.default cochran.test.lab.qcdata

### ** Examples


library(ILS)
data(Glucose)
Glucose.qcdata <- lab.qcdata(Glucose)
str(Glucose.qcdata)
cochran.test(Glucose.qcdata)



