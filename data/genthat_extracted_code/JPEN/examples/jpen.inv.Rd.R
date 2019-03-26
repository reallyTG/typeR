library(JPEN)


### Name: jpen.inv
### Title: JPEN estimate of inverse cov matrix
### Aliases: jpen.inv

### ** Examples

p=10;n=100;
Sig=diag(p);
y=rmvnorm(n,mean=rep(0,p),sigma=Sig);
S=var(y);
gam=1.0;
lam=2*max(abs(S[col(S)!=row(S)]))/p;
Omghat=jpen.inv(var(y),gam,lam);



