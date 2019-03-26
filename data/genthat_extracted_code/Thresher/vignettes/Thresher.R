### R code from vignette source 'Thresher.Rnw'

###################################################
### code chunk number 1: libraries
###################################################
library(Thresher)


###################################################
### code chunk number 2: nbc
###################################################
library(MASS)
library(NbClust)
source("NbClust.txt")


###################################################
### code chunk number 3: load1
###################################################
set.seed(3928270)
ranData <- matrix(rnorm(100*12), ncol=12)
colnames(ranData) <- paste("G", 1:12, sep='')


###################################################
### code chunk number 4: thresh1
###################################################
thresh1 <- Thresher(ranData)
reap1 <- Reaper(thresh1)


###################################################
### code chunk number 5: noise1
###################################################
colnames(ranData)[!reap1@keep]


###################################################
### code chunk number 6: plot1
###################################################
plot(reap1)


###################################################
### code chunk number 7: nclust1
###################################################
reap1@nGroups 


###################################################
### code chunk number 8: heat1
###################################################
heat(reap1)


###################################################
### code chunk number 9: nbclust1
###################################################
nbclust1 <- NbClust(t(ranData), distance="euclidean", min.nc=1, 
         max.nc=10, method="ward.D2", index="trcovw")
nbclust1$Best.nc


###################################################
### code chunk number 10: load2
###################################################
set.seed(3757871)
rho <- 0.5
nProtein <- 16
splinter <- sample((nProtein/2) + (-3:3), 1)
sigma1 <- matrix(rho, ncol=nProtein, nrow=nProtein)
diag(sigma1) <- 1
sigma2 <- sigma1
sigma2[(1+splinter):nProtein, 1:splinter] <- 0
sigma2[1:splinter, (1+splinter):nProtein] <- 0


###################################################
### code chunk number 11: thresh2
###################################################
thresh2 <- SimThresher(sigma2, nSample=300)
summary(thresh2@delta)
reap2 <- Reaper(thresh2)
colnames(reap2@data)[1:splinter]
colnames(reap2@data)[(splinter+1):nProtein]


###################################################
### code chunk number 12: noise2
###################################################
colnames(reap2@data)[!reap2@keep]


###################################################
### code chunk number 13: pc2
###################################################
reap2@pcdim


###################################################
### code chunk number 14: plot2
###################################################
plot(reap2)


###################################################
### code chunk number 15: nclust2
###################################################
reap2@nGroups


###################################################
### code chunk number 16: heat2
###################################################
heat(reap2)


###################################################
### code chunk number 17: nbclust2
###################################################
nbclust2 <- NbClust(t(thresh2@data), distance="euclidean", min.nc=1, 
         max.nc=10, method="ward.D2", index="tracew")
nbclust2$Best.nc


