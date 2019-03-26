library(JPEN)


### Name: jpen
### Title: JPEN Estimate of covariance matrix
### Aliases: jpen

### ** Examples

p=10;n=100;
Sig=diag(p);
y=rmvnorm(n,mean=rep(0,p),sigma=Sig);
gam=1.0;S=var(y);
lam=2/p;
Sighat=jpen(S,gam,lam);



