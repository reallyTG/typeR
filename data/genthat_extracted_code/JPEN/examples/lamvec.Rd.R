library(JPEN)


### Name: lamvec
### Title: returns a vector of values of lambda for given value of gamma
### Aliases: lamvec

### ** Examples

p=10;n=100;Sig=diag(p);
y=rmvnorm(n,mean=rep(0,p),sigma=Sig);
gam=c(0.5);
S=var(y);
c=max(abs(S[row(S)!=col(S)]));
lambda=lamvec(c,gam,p);



