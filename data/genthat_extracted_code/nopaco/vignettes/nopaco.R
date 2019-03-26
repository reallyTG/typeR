### R code from vignette source 'nopaco.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: nopaco.Rnw:29-29
###################################################



###################################################
### code chunk number 2: nopaco.Rnw:40-41
###################################################
library(nopaco)


###################################################
### code chunk number 3: nopaco.Rnw:45-46
###################################################
data(scores)


###################################################
### code chunk number 4: nopaco.Rnw:50-93
###################################################
scatterBarNorm <- function(x, dcol="blue", lhist=20, num.dnorm=5*lhist, xlab,ylab,main,...){
## check input
stopifnot(ncol(x)==2)
if (missing(xlab)) xlab = colnames(x)[1]
if (missing(ylab)) ylab = colnames(x)[2]
if (missing(main)) main = ""
## set up layout and graphical parameters
layMat <- matrix(c(2,0,1,3), ncol=2, byrow=TRUE)
layout(layMat, widths=c(5/7, 2/7), heights=c(2/7, 5/7))
ospc <- 0.5 # outer space
pext <- 4 # par extension down and to the left
bspc <- 1 # space between scatter plot and bar plots
par. <- par(mar=c(pext, pext, 0, 0),
oma=rep(ospc, 4)) # plot parameters
## scatter plot
plot(x, xlim=range(c(x[,1],x[,2])), ylim=range(c(x[,1],x[,2])), xlab=main,ylab="", ...)
abline(a=0,b=1,lty=2)
## 3) determine barplot and height parameter
## histogram (for barplot-ting the density)
xhist <- hist(x[,1], plot=FALSE, breaks=seq(from=min(x[,1]), to=max(x[,1]),
length.out=lhist))
yhist <- hist(x[,2], plot=FALSE, breaks=seq(from=min(x[,2]), to=max(x[,2]),
length.out=lhist)) # note: this uses probability=TRUE
## determine the plot range and all the things needed for the barplots and lines
xx <- seq(min(x[,1]), max(x[,1]), length.out=num.dnorm) # evaluation points for the overlaid density
xy <- dnorm(xx, mean=mean(x[,1]), sd=sd(x[,1])) # density points
yx <- seq(min(x[,2]), max(x[,2]), length.out=num.dnorm)
yy <- dnorm(yx, mean=mean(x[,2]), sd=sd(x[,2]))
## barplot and line for x (top)
par(mar=c(bspc, pext, 0, 0))
barplot(xhist$density, axes=FALSE, ylim=c(0, max(xhist$density, xy)),
space=0,xlab=xlab) # barplot
title(xlab=xlab,line=0)
lines(seq(from=0, to=lhist-1, length.out=num.dnorm), xy, col=dcol) # line
## barplot and line for y (right)
par(mar=c(pext, bspc, 0, 0))
barplot(yhist$density, axes=FALSE, xlim=c(0, max(yhist$density, yy)),
space=0, horiz=TRUE,ylab=ylab) # barplot
title(ylab=ylab,line=0,srt=180)
lines(yy, seq(from=0, to=lhist-1, length.out=num.dnorm), col=dcol) # line
## restore parameters
par(par.)
}


###################################################
### code chunk number 5: modelA
###################################################
pdf("x-modelA.pdf",width=4,height=4)
scatterBarNorm(scores[["modelA"]],pch=21,bg='black',main="model A")
invisible(dev.off())


###################################################
### code chunk number 6: modelB
###################################################
pdf("x-modelB.pdf",width=4,height=4)
scatterBarNorm(scores[["modelB"]],pch=21,bg='black',main="model B")
invisible(dev.off())


###################################################
### code chunk number 7: nopaco.Rnw:117-119
###################################################
getPsi( scores[["modelA"]] )
getPsi( scores[["modelB"]] )


###################################################
### code chunk number 8: nopaco.Rnw:123-125
###################################################
concordance.test( scores[["modelA"]] )
concordance.test( scores[["modelB"]] )


###################################################
### code chunk number 9: nopaco.Rnw:129-131
###################################################
diffTest<-concordance.test(scores[["modelA"]], scores[["modelB"]])
diffTest


###################################################
### code chunk number 10: nopaco.Rnw:135-140
###################################################
coef(diffTest)
diffTest$pvalue
diffTest$psi
diffTest$ci
diffTest$alpha


###################################################
### code chunk number 11: nopaco.Rnw:154-163
###################################################
library(MASS) ##Needed for rmvnorm

set.seed(1);

#A covariance matrix
S <- matrix(0.4,ncol=3,nrow=3); diag(S)<-1 	

#Underlying true expressions
X0 <- mvrnorm(n=100,mu=c(0,0,0),Sigma=S)    						


###################################################
### code chunk number 12: nopaco.Rnw:177-182
###################################################
#Measurement errors replicate 1
Z1 <- mvrnorm(n=100,mu=c(0,0,0),Sigma=diag(c(0,0,0)))                   

#Measurement errors replicate 2
Z2 <- mvrnorm(n=100,mu=c(0,0,0),Sigma=diag(c(0,0.1,0.2))) 


###################################################
### code chunk number 13: nopaco.Rnw:188-193
###################################################
#Replicate matrix 1: True expressions plus error
X1 <- X0 + Z1

#Replicate matrix 2: True expressions plus error
X2 <- X0 + Z2


###################################################
### code chunk number 14: nopaco.Rnw:200-216
###################################################
a<-data.frame(
"replicate1"=exp(rowSums(X1[,1:2])),
"replicate2"=exp(rowSums(X2[,1:2])),
row.names=paste("patient",c(1:nrow(X1)),sep="")
)

b<-data.frame(
"replicate1"=rowSums(X1[,2:3]),
"replicate2"=rowSums(X2[,2:3]),
row.names=paste("patient",c(1:nrow(X1)),sep="")
)

scores = list(modelA=a,modelB=b)





###################################################
### code chunk number 15: nopaco.Rnw:221-222
###################################################
sessionInfo()


