library(ECFsup)


### Name: KSCovL2WS
### Title: L2-norm test using W-S approximation for equality of several
###   covariance functions
### Aliases: KSCovL2WS

### ** Examples

fdata<-list();
fdata[[1]]<-matrix(rnorm(200),20,10);
fdata[[1]]<-matrix(rnorm(300),20,15);
KSCovL2WS(fdata, 0)
KSCovL2WS(fdata, 1)



