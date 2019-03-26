library(deamer)


### Name: deamer-class
### Title: Objects of class 'deamer'
### Aliases: deamer-class deamer.default predict.deamer
### Keywords: distribution deconvolution nonparametric smooth

### ** Examples


#this example based on simulated data presents each method implemented in deamer. 
#the deamer function is presented but the wrappers deamerKE, deamerRO
#and deamerSE would yield the same results.
 
set.seed(12345)
n=1000; M=500
rff=function(x){
  u=rbinom(x, 1, 0.5)
  X=u*rnorm(x, -2, 1)+(1-u)*rnorm(x,2,1)
  return(X)
}
x <- rff(n) #a mixed gaussian distribution

# true density function:
f.true=function(x) (0.5/(sqrt(2*pi)))*(exp(-0.5*(x+2)^2) + exp(-0.5*(x-2)^2))

e <- rlaplace(n, 0, 0.5) # laplace noise
y <- x + e  # observations with additive noise

eps <- rlaplace(M, 0, 0.5) # a sample of pure errors for method="se"
# a 2-column matrix of replicate noisy observations for method="ro"
rep <- matrix(rep(rff(M),each=2)+rlaplace(2*M,0,0.5), byrow=TRUE, ncol=2)
 
#estimation with known error
# the same as deamerKE(y, noise.type="laplace", sigma=0.5)
est.ke <- deamer(y, noise.type="laplace", sigma=0.5, method="ke")  
#will generate a warning since we are assuming mu=0
est.ke

#estimation with an auxiliary sample of errors
# the same as deamerSE(y, errors=eps)
est.se <- deamer(y, errors=eps, method="se")
est.se

#estimation with replicate noisy observations
# the same as deamerRO(y, replicates=rep)
est.ro <- deamer(y, replicates=rep, method="ro")
est.ro

curve(f.true(x), from=-6, to=6,lwd=2, lty=2)
lines(est.ke, lwd=1, col="green3")
lines(est.se, lwd=1, col="blue2")
lines(est.ro, lwd=1, col="orange")
legend("topright", lty=c(2,1,1,1), col=c("black", "green3", "blue2","orange"), 
        legend=c("true density", "method='ke'", "method='se'", "method='ro'"),
        bty='n')
 
#compare predictions for each method for newx
newx=c(-2,0,2)
rbind(
      predict(est.ke, newdata=newx),
      predict(est.se, newdata=newx),
      predict(est.ro, newdata=newx)
      ) -> preds
dimnames(preds)<-list(c("ke","se","ro"),newx)
        #predictions are made at newdata
preds




