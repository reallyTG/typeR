library(spaMM)


### Name: MSFDR
### Title: Multiple-Stage False Discovery Rate procedure
### Aliases: MSFDR
### Keywords: models

### ** Examples

if (spaMM.getOption("example_maxtime")>1.4) {
data("wafers")
nullfit <- fitme(y~1+(1|batch), data=wafers,family=Gamma(log))
fullfit <- fitme(y ~X1+X2+X1*X3+X2*X3+I(X2^2)+(1|batch), data=wafers, family=Gamma(log))
MSFDR(nullfit=nullfit,fullfit=fullfit)
}



