library(ECFsup)


### Name: KSCovL2
### Title: L2-norm based test of equality of several covariance functions
### Aliases: KSCovL2

### ** Examples

fdata<-list();
fdata[[1]]<-matrix(rnorm(200),20,10);
fdata[[1]]<-matrix(rnorm(300),20,15);
KSCovL2(fdata)
KSCovL2(fdata, 500)



