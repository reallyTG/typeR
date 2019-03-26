library(ECFsup)


### Name: ECFsup-package
### Title: Equal Covariance Functions Testing by L2-Norm and Sup-Norm
### Aliases: ECFsup-package ECFsup
### Keywords: package htest

### ** Examples

fdata<-list();
fdata[[1]]<-matrix(rnorm(200),20,10);
fdata[[1]]<-matrix(rnorm(300),20,15);
KSCovL2(fdata);KSCovsup(fdata);



