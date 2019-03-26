library(ctmcd)


### Name: plotM
### Title: Matrix Plot Function
### Aliases: plotM

### ** Examples
gm0=matrix(1,8,8)
diag(gm0)=0
diag(gm0)=-rowSums(gm0)
gm0[8,]=0

plotM(gm0)



