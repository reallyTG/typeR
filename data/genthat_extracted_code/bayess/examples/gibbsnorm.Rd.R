library(bayess)


### Name: gibbsnorm
### Title: Gibbs sampler for a generic mixture posterior distribution
### Aliases: gibbsnorm
### Keywords: Gibbs mixtures conjugate priors

### ** Examples

data(datha)
datha=as.matrix(datha)
mix=list(k=3,mu=mean(datha),sig=var(datha))
res=gibbsnorm(10,datha,mix)
plot(res$p[,1],type="l",col="steelblue3",xlab="iterations",ylab="p")




