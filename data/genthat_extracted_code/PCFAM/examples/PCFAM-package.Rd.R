library(PCFAM)


### Name: PCFAM-package
### Title: Computation of ancestry scores with mixed families and unrelated
###   individuals
### Aliases: PCFAM-package PCFAM

### ** Examples

X <- matrix(rbinom(1000*20,2,0.4),1000,20)
X[,1]=X[,2]*0.9
X=rowscale(X)
Xresid=residualize(X)
corXresid=cor(Xresid)
myfam=findfamilies(corXresid,0.1)
K=3
myms.pca=ms.pca(X,corXresid,0.1,K)
familyave.result=familyave(X,myfam,top=K)



