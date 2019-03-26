library(CNLTreg)


### Name: denoisepermC
### Title: Denoises a signal using the complex-valued lifting transform and
###   multivariate soft thresholding
### Aliases: denoisepermC
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

     # perform the complex-valued denoising procedure to the noisy signal (x,f):
     est<-denoisepermC(x,f,LocalPred=AdaptPred,neigh=1,returnall=FALSE)




