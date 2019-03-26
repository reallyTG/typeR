library(pRSR)


### Name: GetFitHReg
### Title: Compute loglikelihood ratio test statistic
### Aliases: GetFitHReg
### Keywords: ts

### ** Examples

#Simple Examples
z<-SimulateHReg(10, f=2.5/10, 1, 2)
GetFitHReg(z)
t<-seq(2,20,2)
GetFitHReg(y=z, t=t)
GetFitHReg(z, nf=25)



