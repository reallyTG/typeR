library(ILS)


### Name: lab.qcs
### Title: Create an object of class 'lab.qcs' to perform statistical
###   quality control. This function is used to compute statistics required
###   for plotting Statitics
### Aliases: lab.qcs print.lab.qcs summary.lab.qcs

### ** Examples


library(ILS)
data(Glucose)
Glucose.qcdata <- lab.qcdata(Glucose)
str(Glucose.qcdata)
Glucose.qcs <- lab.qcs(Glucose.qcdata)
str(Glucose.qcs)
summary(Glucose.qcs)



