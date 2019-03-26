library(dirmcmc)


### Name: metropdir.adapt
### Title: Directional Metropolis Hastings with Adaptation.
### Aliases: metropdir.adapt
### Keywords: adaptive dmh, mcmc,

### ** Examples

## Not run: 
##D Sigma <- matrix(c(1,0.2,0.2,1),2,2)
##D mu <- c(1,1)
##D Sig.Inv <- solve(Sigma)
##D Sig.det.sqrt <- sqrt(det(Sigma))
##D logf <- function(x,mu,Sig.Inv){
##D   x.center <- as.numeric((x-mu))
##D   out <- crossprod(x.center,Sig.Inv)
##D   out <- sum(out*x.center)
##D   -out/2
##D   }
##D 
##D gr.logf <- function(x,mu,Sig.Inv){
##D   x.center <- as.numeric((x-mu))
##D   out <- crossprod(x.center,Sig.Inv)
##D   -as.numeric(out)
##D }
##D set.seed(1234)
##D system.time(out <- metropdir.adapt(obj = logf, dobj = gr.logf, initial = c(1,1),
##D                          lchain = 1e4,sd.prop=1,steplen=0,s=1, mu = mu,
##D                          Sig.Inv = Sig.Inv,targetacc=0.44))
##D #acceptance rate
##D out$accept
##D #density plot
##D plot(density(out$batch[,1]))
## End(Not run)



