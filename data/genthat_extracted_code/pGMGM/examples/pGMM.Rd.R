library(pGMGM)


### Name: pGMM
### Title: Estimating multiple Gaussian graphical models (GGM) in penalized
###   Gaussian mixture models (GMM).
### Aliases: pGMM

### ** Examples


data(jglfit)

# simulate data

set.seed(12345)



Y1 = rmvnorm(1*sum(jglfit$membership==1), jglfit$mu[1,], solve(round(jglfit$covinv[[1]], digits=3)))
Y2 = rmvnorm(1*sum(jglfit$membership==2), jglfit$mu[2,], solve(round(jglfit$covinv[[2]], digits=3)))
Y3 = rmvnorm(1*sum(jglfit$membership==3), jglfit$mu[3,], solve(round(jglfit$covinv[[3]], digits=3)))
Y4 = rmvnorm(1*sum(jglfit$membership==4), jglfit$mu[4,], solve(round(jglfit$covinv[[4]], digits=3)))

Y=rbind(Y1,Y2,Y3,Y4)
p=ncol(Y)

# test

test = pGMM(Y, k=2, method="New-SP", lambda1=1, lambda2=1, ncluster=4)



