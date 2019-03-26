library(fda.usc)


### Name: S.np
### Title: Smoothing matrix by nonparametric methods.
### Aliases: S.np S.LLR S.NW S.KNN
### Keywords: smooth

### ** Examples


tt=1:101
S=S.LLR(tt,h=5)
S2=S.LLR(tt,h=10,Ker=Ker.tri)
S3=S.NW(tt,h=10,Ker=Ker.tri)
S4=S.KNN(tt,h=5,Ker=Ker.tri)
par(mfrow=c(2,2))
image(S)
image(S2)
image(S3)
image(S4)




