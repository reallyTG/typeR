library(JPEN)


### Name: jpen.tune
### Title: Tuning parameter selection based on minimization of 5 fold mean
###   square error.
### Aliases: jpen.tune

### ** Examples

p=10;n=100;
Sig=diag(p);
y=rmvnorm(n,mean=rep(0,p),sigma=Sig);
gama=c(0.5,1.0);
opt=jpen.tune(Ytr=y,gama);



