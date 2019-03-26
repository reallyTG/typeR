library(robCompositions)


### Name: adtest
### Title: Anderson-Darling Normality Tests
### Aliases: adtest
### Keywords: htest

### ** Examples


adtest(rnorm(100))
data(machineOperators)
x <- machineOperators
adtest(pivotCoord(x[,1:2]))
adtest(pivotCoord(x[,1:3]))
adtest(pivotCoord(x))
adtest(pivotCoord(x[,1:2]), locscatt="robust")




