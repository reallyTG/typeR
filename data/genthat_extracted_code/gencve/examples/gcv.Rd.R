library(gencve)


### Name: gcv
### Title: Estimate EPE Using Delete-d Cross-Validation
### Aliases: gcv
### Keywords: models regression classif

### ** Examples

#Simple example but in general, MaxIter >= 1000 is recommended.
Xy <- ShaoReg()
gcv(Xy[,1:8], Xy[,9], MaxIter=25, d=5)



