library(CNLTreg)


### Name: cnlt.reg
### Title: Performs 'nondecimated' complex-valued wavelet lifting for
###   signal denoising
### Aliases: cnlt.reg
### Keywords: methods regression

### ** Examples
 
    library(adlift)

    # construct an (irregular) observation grid
     x<-runif(256) 
     
     #construct the true, normally unknown, signal
     g<-make.signal2("blocks",x=x) 
     
     #generate noise with mean 0 and signal-to-noise ratio 5
     noise<-rnorm(256,mean=0,sd=sqrt(var(g))/5)
     
     #generate a noisy version of g 
     f<-g+noise 
     
     #decide on a number of random trajectories to be used (e.g. J=5 below), and apply
     # the nondecimated lifting transform to the noisy signal (x,f): 
## Not run: 
##D      est<-cnlt.reg(x,f,P=50,LocalPred=AdaptPred,neighbours=1,returnall=FALSE) 
## End(Not run)



