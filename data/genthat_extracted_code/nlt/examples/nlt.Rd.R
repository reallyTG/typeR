library(nlt)


### Name: nlt
### Title: Denoise a signal using a nondecimated lifting transform
### Aliases: nlt
### Keywords: nonparametric

### ** Examples

# construct the grid
x<-runif(256) 

# construct the true, normally unknown, signal
g<-make.signal2("blocks",x=x) 

# generate noise with mean 0 and signal-to-noise ratio 5
noise<-rnorm(256,mean=0,sd=sqrt(var(g))/5)

# generate a noisy version of g 
f<-g+noise 

# decide on a number of random trajectories to be used (below J=100, in paper J=20,30), and apply
# the nondecimated lifting transform to the noisy signal (x,f) 
#
# below we apply the modified lifting transform J times, each time following a different path, 
# and using adaptive prediction with neighbourhoods of size 2 in closest configuration; 
# all details are then thresholded using posterior medians and the algorithms inverted
# the aggregate estimator of g proposed by our method is found in out$aveghat
out<-nlt(x,f,J=10,Pred=AdaptPred,neighbours=2,closest=TRUE,intercept=TRUE,nkeep=2,trule="median") 



