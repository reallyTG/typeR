library(CNLTreg)


### Name: fwtnppermC
### Title: Forward complex wavelet lifting transform
### Aliases: fwtnppermC
### Keywords: methods

### ** Examples

    library(adlift)

    # construct an (irregular) observation grid
     x<-runif(256)

     #construct a signal
     f<-make.signal2("blocks",x=x)

     fwd<-fwtnppermC(x,f,LocalPred=AdaptPred,neigh=1,closest=FALSE)

     # have a look at the complex-valued coefficients and the removal trajectory:

     fwd$coeffv

     fwd$removelist	



