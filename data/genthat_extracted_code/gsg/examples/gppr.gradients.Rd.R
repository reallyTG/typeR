library(gsg)


### Name: gppr.gradients
### Title: A function to calculate selection gradients from generalized
###   additive model-based characterizions of fitness functions.
### Aliases: gppr.gradients
### Keywords: ~kwd1 ~kwd2

### ** Examples

# simulated data (two traits, stabilizing selection on trait 1)
n<-250
z<-cbind(rnorm(n,0,1),rnorm(n,0,1))
W<-rpois(n,exp(2-0.6*z[,1]^2))
d<-as.data.frame(cbind(W,z))
names(d)<-c("W","z1","z2")

fit.func<-gppr(y="W",xterms=c("z1","z2"),data=d,family="poisson",
   nterms=2,max.terms=2)

gppr.gradients(mod= fit.func,phenotype=c("z1","z2"),se.method='n',standardize=FALSE)



