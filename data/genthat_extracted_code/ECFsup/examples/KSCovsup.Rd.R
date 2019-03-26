library(ECFsup)


### Name: KSCovsup
### Title: Sup-norm based test of equality of several covariance functions
### Aliases: KSCovsup

### ** Examples

fdata<-list();
fdata[[1]]<-matrix(rnorm(200),20,10);
fdata[[1]]<-matrix(rnorm(300),20,15);
KSCovsup(fdata)
KSCovsup(fdata, 500)



