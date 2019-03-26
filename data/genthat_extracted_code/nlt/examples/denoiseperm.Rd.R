library(nlt)


### Name: denoiseperm
### Title: Denoise a signal using the modified lifting transform and
###   empirical Bayes thresholding
### Aliases: denoiseperm
### Keywords: nonparametric

### ** Examples

# construct a grid
x<-runif(256)

# construct a true, normally unknown, signal 
g<-make.signal2("bumps",x=x) 

# now generate noise (here with mean 0 and signal-to-noise ratio 3)
noise<-rnorm(256,mean=0,sd=sqrt(var(g))/3) 

# obtain a noisy version of the true signal g
f<-g+noise 

# construct the trajectory which will indicate the order of point removal that will be followed by
# the modified lifting algorithm 
# vec below gives the first (length(x)-keep) entries of a random permutation of (1:length(x))
vec<-sample(1:256,254,FALSE)

# denoise the signal (x,f) by applying the modified lifting transform following the removal order 
# in vec and using adaptive prediction
# and neighbourhoods of size 2 in symmetrical configuration 
# the details are then thresholded using posterior medians and the algorithm inverted
# the proposed estimate of g is given by out$fhat$coeff

out<-denoiseperm(x,f,pred=AdaptPred,neigh=1,int=TRUE,clo=FALSE,keep=2,rule="median",per=vec) 



