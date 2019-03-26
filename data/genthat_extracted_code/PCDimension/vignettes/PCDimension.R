### R code from vignette source 'PCDimension.Rnw'

###################################################
### code chunk number 1: libraries
###################################################
library(PCDimension)
library(nFactors) # implements Bartlett's test
library(MASS) # for mvrnorm to simulate data


###################################################
### code chunk number 2: load
###################################################
set.seed(12345)
NC <- 15
NS <- 200
ranData <- matrix(rnorm(NS*NC, 6), ncol=NC)


###################################################
### code chunk number 3: bart
###################################################
nBartlett(data.frame(ranData), nrow(ranData))


###################################################
### code chunk number 4: rnd
###################################################
rndLambdaF(ranData) # input argument is data


###################################################
### code chunk number 5: spca
###################################################
spca <- SamplePCA(t(ranData))
lambda <- spca@variances[1:(NC-1)] 
bsDimension(lambda)


###################################################
### code chunk number 6: ag
###################################################
ag.obj <- AuerGervini(spca)
agDimension(ag.obj)


###################################################
### code chunk number 7: tabs
###################################################
f <- makeAgCpmFun("Exponential")
agfuns <- list(twice=agDimTwiceMean, specc=agDimSpectral,
               km=agDimKmeans, km3=agDimKmeans3, 
               tt=agDimTtest, tt2=agDimTtest2,
               cpt=agDimCPT, cpm=f)
compareAgDimMethods(ag.obj, agfuns) # compare the list of all criteria


###################################################
### code chunk number 8: hideme
###################################################
bs <- brokenStick(1:NC, NC)
bs0 <- brokenStick(1:(NC-1), (NC-1))


###################################################
### code chunk number 9: PCDimension.Rnw:160-163
###################################################
pts <- screeplot(spca, ylim=c(0, 0.2))
lines(pts, bs, type='b', col='blue', lwd=2, pch=16)
lines(pts[-NC], bs0, type='b', col='red', lwd=2, pch=16) 


###################################################
### code chunk number 10: PCDimension.Rnw:172-173
###################################################
plot(ag.obj, agfuns)


###################################################
### code chunk number 11: struct
###################################################
mu <- rep(0, 15)
sigma <- matrix(0, 15, 15)
sigma[1:8, 1:8] <- 0.7
sigma[9:15, 9:15] <- 0.3
diag(sigma) <- 1
struct <- mvrnorm(200, mu, sigma)


###################################################
### code chunk number 12: bart
###################################################
nBartlett(data.frame(struct), nrow(struct))


###################################################
### code chunk number 13: rnd
###################################################
rndLambdaF(struct, B = 1000, alpha = 0.05) # input argument is data


###################################################
### code chunk number 14: spca
###################################################
spca <- SamplePCA(t(struct))
lambda <- spca@variances[1:(NC-1)] 
bsDimension(lambda)


###################################################
### code chunk number 15: hideme
###################################################
bs <- brokenStick(1:NC, NC)
bs0 <- brokenStick(1:(NC-1), (NC-1))


###################################################
### code chunk number 16: PCDimension.Rnw:250-253
###################################################
pts <- screeplot(spca)
lines(pts, bs, type='b', col='blue', lwd=2, pch=16)
lines(pts[-NC], bs0, type='b', col='red', lwd=2, pch=16) 


###################################################
### code chunk number 17: ag
###################################################
ag.obj <- AuerGervini(spca)
agDimension(ag.obj)


###################################################
### code chunk number 18: tabs
###################################################
f <- makeAgCpmFun("Exponential")
agfuns <- list(twice=agDimTwiceMean, specc=agDimSpectral,
               km=agDimKmeans, km3=agDimKmeans3, 
               tt=agDimTtest, tt2=agDimTtest2,
               cpt=agDimCPT, cpm=f)
compareAgDimMethods(ag.obj, agfuns) # compare the list of all criteria


###################################################
### code chunk number 19: PCDimension.Rnw:286-287
###################################################
plot(ag.obj, agfuns)


