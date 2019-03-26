library(systemicrisk)


### Name: steps_ERE
### Title: Perform Steps of the Gibbs Sampler of the ERE model
### Aliases: steps_ERE

### ** Examples

L <- matrix(rexp(4*4),nrow=4,ncol=4); diag(L)=0;
p <- matrix(0.5,nrow=4,ncol=4); diag(p) <-0;
lambda <- matrix(1,nrow=4,ncol=4); diag(lambda)<-0;

L <- steps_ERE(L=L,p=p,lambda=lambda,nsamples=5,thin=50,burnin=20)
L




