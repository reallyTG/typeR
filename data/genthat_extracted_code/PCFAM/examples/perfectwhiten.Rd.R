library(PCFAM)


### Name: perfectwhiten
### Title: The covariance preserving whitening function.
### Aliases: perfectwhiten

### ** Examples

X <- matrix(rbinom(1000*20,2,0.4),1000,20)
X[,1]=X[,2]*0.9
X=rowscale(X)
Xresid=residualize(X)
library(PCFAM)
corXresid=cor(Xresid)
myfam=findfamilies(corXresid,0.1)
K=3
perfect.result=perfectwhiten(X[,which(myfam==0)],X[,which(myfam==1)])





