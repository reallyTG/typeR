### R code from vignette source 'midpAdjustment.Rnw'

###################################################
### code chunk number 1: midpAdjustment.Rnw:27-28
###################################################
library(exact2x2)


###################################################
### code chunk number 2: midpAdjustment.Rnw:160-166
###################################################
x1<-6
n1<-12
x2<-15
n2<- 17
exact2x2(matrix(c(x2,n2-x2,x1,n1-x1),2,2), tsmethod="central", midp=FALSE)
binomMeld.test(x1,n1,x2,n2, parmtype="oddsratio",  midp=FALSE)


###################################################
### code chunk number 3: midpAdjustment.Rnw:171-177
###################################################
x1<-6
n1<-12
x2<-15
n2<- 17
exact2x2(matrix(c(x2,n2-x2,x1,n1-x1),2,2), tsmethod="central", midp=TRUE)
binomMeld.test(x1,n1,x2,n2, parmtype="oddsratio",  midp=TRUE)


