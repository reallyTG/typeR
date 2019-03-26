### R code from vignette source 'MLInterfaces.Rnw'

###################################################
### code chunk number 1: MLInterfaces.Rnw:108-110
###################################################
library(MLInterfaces)
library(golubEsets)


###################################################
### code chunk number 2: redu
###################################################
data(Golub_Merge)
smallG <- Golub_Merge[200:259,]
smallG


###################################################
### code chunk number 3: doknnB
###################################################
#krun <- knnB( smallG, "ALL.AML", trainInd=1:40 )
krun = MLearn(ALL.AML~., smallG, knnI(k=1), 1:40)
krun


###################################################
### code chunk number 4: lkco
###################################################
confuMat(krun)


###################################################
### code chunk number 5: lkco2
###################################################
set.seed(1234)
#nns <- nnetB( smallG[1:10,], "ALL.AML", trainInd=1:40, size=2, decay=.01, maxit=250 )
nns <- MLearn( ALL.AML~., smallG[1:10,], nnetI, trainInd=1:40, size=2, decay=.01, maxit=250 )
nns
confuMat(nns)


###################################################
### code chunk number 6: MLInterfaces.Rnw:178-179 (eval = FALSE)
###################################################
## summary(RObject(nns))


###################################################
### code chunk number 7: MLInterfaces.Rnw:183-184 (eval = FALSE)
###################################################
## ags <- agnesB(smallG, k=4, height=0, stand=FALSE)


###################################################
### code chunk number 8: MLInterfaces.Rnw:185-186 (eval = FALSE)
###################################################
## plot(RObject(ags), which.plot=2)


###################################################
### code chunk number 9: lkci
###################################################
getClass("learnerSchema")
getClass("xvalSpec")


###################################################
### code chunk number 10: lkcc
###################################################
getClass("classifierOutput")


###################################################
### code chunk number 11: lkcl (eval = FALSE)
###################################################
## getClass("clustOutput")


###################################################
### code chunk number 12: dox
###################################################
library(golubEsets)
data(Golub_Merge)
smallG <- Golub_Merge[200:250,]
lk1 <- MLearn(ALL.AML~., smallG, knnI(k=1,l=0), xvalSpec("LOO"))
confuMat(lk1)


###################################################
### code chunk number 13: doxr
###################################################
ranpart = function(K, data) {
 N = nrow(data)
 cu = as.numeric(cut(1:N, K))
 sample(cu, size=N, replace=FALSE)
}
ranPartition = function(K) function(data, clab, iternum) {
 p = ranpart(K, data)
 which(p != iternum) # to retain training fraction
}
lkran <- MLearn(ALL.AML~., smallG, knnI(k=1,l=0), xvalSpec("LOG", 8, partitionFunc=ranPartition(8)))
confuMat(lkran)


###################################################
### code chunk number 14: dox2
###################################################
lk3 <- MLearn(ALL.AML~., smallG, knnI(k=1,l=0), xvalSpec("LOG", 8, partitionFunc=balKfold.xvspec(8)))
confuMat(lk3)


###################################################
### code chunk number 15: dofs
###################################################
data(iris)
iris2 = iris[ iris$Species %in% levels(iris$Species)[1:2], ]
iris2$Species = factor(iris2$Species) # drop unused levels
x1 = MLearn(Species~., iris2, ldaI, xvalSpec("LOG", 3,
   balKfold.xvspec(3), fs.absT(3)))
fsHistory(x1)


###################################################
### code chunk number 16: getpp
###################################################
predProb <- round(testScores(nns),3)


###################################################
### code chunk number 17: gettrue
###################################################
truth <- as.character(smallG$ALL.AML[-c(1:40)]) 
simpPred <- as.character(testPredictions(nns))


###################################################
### code chunk number 18: mkclo
###################################################
douClo <- function(pprob)  function(lo,hi) pprob>lo & pprob<hi


###################################################
### code chunk number 19: evclo
###################################################
smallDou <- douClo(predProb)


###################################################
### code chunk number 20: repla
###################################################
douPred <- simpPred
douPred[smallDou(.35,.65)] <- "doubt"


###################################################
### code chunk number 21: lkpr
###################################################
mm <- cbind(predProb,truth,simpPred,douPred)
mm
table(mm[,"truth"], mm[,"simpPred"])
table(mm[,"truth"], mm[,"douPred"])


