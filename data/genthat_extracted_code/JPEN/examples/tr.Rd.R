library(JPEN)


### Name: tr
### Title: Trace of matrix
### Aliases: tr

### ** Examples

p=10;n=100;Sig=diag(p);
y=rmvnorm(n,mean=rep(0,p),sigma=Sig);
S=var(y);
tr(S);



