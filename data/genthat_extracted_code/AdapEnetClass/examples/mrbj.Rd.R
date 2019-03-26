library(AdapEnetClass)


### Name: mrbj
### Title: Modified resampling based Buckley-James method
### Aliases: mrbj
### Keywords: Buckley-James method Elastic net

### ** Examples

#For full data typically used for AFT models (using imputeYn (2015) package)
dat<-data(n=100, p=10, r=0, b1=c(rep(5,5),rep(0,5)), sig=1, Cper=0)

#mrbj: modified resampling based Buckley-James method. 
#When gehanonly=T, it give both the Gehan and the elastic net  estimates 
## Not run: fit1<-mrbj(cbind(dat$y, dat$delta) ~ dat$x, mcsize=100, trace=FALSE, gehanonly=TRUE)
## Not run: fit1

#mrbj: modified resampling based Buckley-James method. 
#Only for Gehan estimates
fit2<-mrbj(cbind(dat$y, dat$delta) ~ dat$x, mcsize=100, trace=FALSE, gehanonly=FALSE)
## No test: 
fit2
## End(No test)



