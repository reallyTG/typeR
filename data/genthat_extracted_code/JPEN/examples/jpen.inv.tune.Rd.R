library(JPEN)


### Name: jpen.inv.tune
### Title: Tuning parameter Selection for inverse covariance matrix
###   estimation based on minimization of Gaussian log-likelihood.
### Aliases: jpen.inv.tune

### ** Examples

p=10;n=100;
Sig=diag(p);
y=rmvnorm(n,mean=rep(0,p),sigma=Sig);
gama=c(0.5,1.0);
opt=jpen.inv.tune(var(y),gama);



