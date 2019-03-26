library(gsg)


### Name: gppr
### Title: Generalised projection pursuit regression
### Aliases: gppr

### ** Examples

# simulated data (two traits, stabilizing selection on trait 1)
n<-250
z<-cbind(rnorm(n,0,1),rnorm(n,0,1))
W<-rpois(n,exp(2-0.6*z[,1]^2))
d<-as.data.frame(cbind(W,z))
names(d)<-c("W","z1","z2")

fit.func<-gppr(y="W",xterms=c("z1","z2"),data=d,family="poisson",
   nterms=2,max.terms=2)

# direction of axes, and their loadings
fit.func$alpha
fit.func$beta

## not run - plot ridge functions (linear predictor scale)
# par(mfrow=c(1,2))
# plot(fit.func)



