### R code from vignette source 'usesb.Rnw'

###################################################
### code chunk number 1: usesb.Rnw:53-54 (eval = FALSE)
###################################################
## install.packages("scaleboot")


###################################################
### code chunk number 2: usesb.Rnw:67-69
###################################################
set.seed(100)



###################################################
### code chunk number 3: data1
###################################################
simdata <- function(n,y,sd) {
  m <- length(y)
  x <- matrix(rnorm(m*n,0,sd),m,n)
  t(x + (y - apply(x,1,mean)))
}

X <- simdata(100,c(0,1,1,1,1,1,1,1,1,1),10)
round(X[1:3,],3)
y <- apply(X,2,mean)
round(y,3)



###################################################
### code chunk number 4: mc1
###################################################
mc1 <- function(x) all(x[1] >= x[-1])
mc1(y)


###################################################
### code chunk number 5: boot1
###################################################
countw <- function(x,w,fn) {
  y <- apply(w*x,2,sum)/sum(w)
  fn(y)
}

w <- as.vector(rmultinom(1,100,rep(1,100)))
w
countw(X,w,mc1)


###################################################
### code chunk number 6: load
###################################################
library(scaleboot)


###################################################
### code chunk number 7: sim1
###################################################
sa <- 9^seq(-1,1,length=13)
nb <- 10000

X.sb <- scaleboot(X,nb,sa,countw,mc1)


###################################################
### code chunk number 8: ans1
###################################################
summary(X.sb)  # k = 3 (default)


###################################################
### code chunk number 9: ans1b
###################################################
summary(X.sb, k=1:3)  # k = 1, 2, 3


###################################################
### code chunk number 10: coef1
###################################################
X.sb



###################################################
### code chunk number 11: diag1f
###################################################
plot(X.sb,legend="topleft")


###################################################
### code chunk number 12: usesb.Rnw:228-229
###################################################
plot(X.sb,legend="topleft")


###################################################
### code chunk number 13: diag1f2
###################################################
plot(X.sb,xval="sigma",log="x",yval="pvalue",legend="topleft")


###################################################
### code chunk number 14: usesb.Rnw:241-242
###################################################
plot(X.sb,xval="sigma",log="x",yval="pvalue",legend="topleft")


###################################################
### code chunk number 15: diag1s
###################################################
plot(summary(X.sb),legend="topleft")


###################################################
### code chunk number 16: usesb.Rnw:303-304
###################################################
plot(summary(X.sb),legend="topleft")


###################################################
### code chunk number 17: usesb.Rnw:332-337 (eval = FALSE)
###################################################
## library(pvclust)
## data(lung)
## sa <- 9^seq(-1,1,length=13)
## nb <- 10000
## lung73.pvclust <- pvclust(lung,r=1/sa,nboot=nb)


###################################################
### code chunk number 18: usesb.Rnw:349-351 (eval = FALSE)
###################################################
## library(scaleboot)
## lung73.sb <- sbfit(lung73.pvclust)


###################################################
### code chunk number 19: lung73
###################################################
library(scaleboot)
data(lung73)


###################################################
### code chunk number 20: usesb.Rnw:367-376 (eval = FALSE)
###################################################
## library(snow)
## cl <- makeCluster(40)
## library(pvclust)
## data(lung)
## sa <- 9^seq(-1,1,length=13)
## nb <- 10000
## lung73.pvclust <- parPvclust(cl,lung,r=1/sa,nboot=nb)
## library(scaleboot)
## lung73.sb <- sbfit(lung73.pvclust,cluster=cl)


###################################################
### code chunk number 21: lungk3
###################################################
lung73.k3 <- sbpvclust(lung73.pvclust,lung73.sb)


###################################################
### code chunk number 22: lungplot
###################################################
library(pvclust)
plot(lung73.k3, cex=0.5, cex.pv=0.7)
pvrect(lung73.k3)


###################################################
### code chunk number 23: usesb.Rnw:395-396
###################################################
library(pvclust)
plot(lung73.k3, cex=0.5, cex.pv=0.7)
pvrect(lung73.k3)


###################################################
### code chunk number 24: lungk2
###################################################
lung73.k2 <- sbpvclust(lung73.pvclust,lung73.sb, k=2)


###################################################
### code chunk number 25: lungplot67
###################################################
plot(lung73.sb[[67]],legend="topleft")


###################################################
### code chunk number 26: usesb.Rnw:415-416
###################################################
plot(lung73.sb[[67]],legend="topleft")


###################################################
### code chunk number 27: lungpval67
###################################################
summary(lung73.sb[[67]])


###################################################
### code chunk number 28: lungext67
###################################################
plot(summary(lung73.sb[[67]]),legend="topleft")


###################################################
### code chunk number 29: usesb.Rnw:432-433
###################################################
plot(summary(lung73.sb[[67]]),legend="topleft")


###################################################
### code chunk number 30: lungsummarys
###################################################
summary(lung73.sb[c(62,67,69,71)])


###################################################
### code chunk number 31: lungpvals
###################################################
plot(lung73.sb[c(62,67,69,71)])


###################################################
### code chunk number 32: usesb.Rnw:449-450
###################################################
plot(lung73.sb[c(62,67,69,71)])


###################################################
### code chunk number 33: usesb.Rnw:523-527 (eval = FALSE)
###################################################
## library(scaleboot)
## mam15.mt <- read.mt("mam15.mt")
## mam15.trees <- relltest(mam15.mt)
## summary(mam15.trees)


###################################################
### code chunk number 34: usesb.Rnw:572-577 (eval = FALSE)
###################################################
## library(scaleboot)
## mam15.mt <- read.mt("mam15.mt")
## mam15.ass <- read.ass("mam15.ass")
## mam15.relltest <- relltest(mam15.mt,ass=mam15.ass)
## summary(mam15.relltest)


###################################################
### code chunk number 35: lung73
###################################################
library(scaleboot)
data(mam15)


###################################################
### code chunk number 36: usesb.Rnw:592-593 (eval = FALSE)
###################################################
## mam15.trees <- mam15.relltest[1:15]


###################################################
### code chunk number 37: usesb.Rnw:600-606 (eval = FALSE)
###################################################
## library(snow)
## cl <- makeCluster(40)
## library(scaleboot)
## mam15.mt <- read.mt("mam15.mt")
## mam15.ass <- read.ass("mam15.ass")
## mam15.relltest <- relltest(mam15.mt,nb=100000,ass=mam15.ass)


###################################################
### code chunk number 38: prepmam
###################################################
library(scaleboot)
data(mam15)
mam15.trees <- mam15.relltest[1:15]



###################################################
### code chunk number 39: sortmam
###################################################
stat <- attr(mam15.trees,"stat")
o <- order(stat)
mam15.trees <- mam15.trees[o]
summary(mam15.trees, k=1:3)


###################################################
### code chunk number 40: mamplots
###################################################
plot(mam15.trees[1:4])


###################################################
### code chunk number 41: usesb.Rnw:644-645
###################################################
plot(mam15.trees[1:4])


