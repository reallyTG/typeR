### R code from vignette source 'ToolsForCoDa.Rnw'
### Encoding: ISO8859-1

###################################################
### code chunk number 1: ToolsForCoDa.Rnw:71-72
###################################################
options(prompt = "R> ", continue = "+ ", width = 70, useFancyQuotes = FALSE)


###################################################
### code chunk number 2: ToolsForCoDa.Rnw:75-77 (eval = FALSE)
###################################################
## install.packages("ToolsForCoDa")
## library("ToolsForCoDa")


###################################################
### code chunk number 3: ToolsForCoDa.Rnw:84-85 (eval = FALSE)
###################################################
## vignette("ToolsForCoDa")


###################################################
### code chunk number 4: ToolsForCoDa.Rnw:93-98
###################################################
library(HardyWeinberg) # needed for making some ternary diagrams
library(ToolsForCoDa)
data("Artificial")
Xsim.com <- Artificial$Xsim.com
Ysim.com <- Artificial$Ysim.com


###################################################
### code chunk number 5: ToolsForCoDa.Rnw:106-119
###################################################
opar <- par(mfrow=c(1,2),mar=c(3,3,2,0)+0.5,mgp=c(2,1,0),pty="s")
par(mfg=c(1,1))
out <- HWTernaryPlot(Xsim.com,50,region=0,vbounds=FALSE,hwcurve=FALSE,
                     vertexlab=c(expression(X[1]),
                                 expression(X[2]),
                                 expression(X[3])))
par(mfg=c(1,2))
out <- HWTernaryPlot(Ysim.com,50,region=0,vbounds=FALSE,
                     hwcurve=FALSE,
                     vertexlab=c(expression(Y[1]),
                                 expression(Y[2]),
                                 expression(Y[3])))
par(opar)


###################################################
### code chunk number 6: ToolsForCoDa.Rnw:128-132
###################################################
Xsub.clr <- clrmat(Xsim.com)
Ysub.clr <- clrmat(Ysim.com)
colnames(Xsub.clr) <- paste("X",1:3,sep="")
colnames(Ysub.clr) <- paste("Y",1:3,sep="")


###################################################
### code chunk number 7: ToolsForCoDa.Rnw:137-138
###################################################
res.cco <- canocov(Xsub.clr,Ysub.clr)


###################################################
### code chunk number 8: ToolsForCoDa.Rnw:144-145
###################################################
round(diag(res.cco$ccor),digits=3)


###################################################
### code chunk number 9: ToolsForCoDa.Rnw:150-152
###################################################
res.cco$A
res.cco$B


###################################################
### code chunk number 10: ToolsForCoDa.Rnw:159-161
###################################################
res.cco$Rxu
res.cco$Ryv


###################################################
### code chunk number 11: ToolsForCoDa.Rnw:166-168
###################################################
res.cco$fitXs
res.cco$fitYs


###################################################
### code chunk number 12: ToolsForCoDa.Rnw:173-175
###################################################
res.cco$fitXp
res.cco$fitYp


###################################################
### code chunk number 13: ToolsForCoDa.Rnw:185-264
###################################################

opar <- par(mfrow=c(2,2),mar=c(3,3,2,0)+0.5,mgp=c(2,1,0))
par(mfg=c(1,1))
#
# Figure A
#
Z <- rbind(res.cco$Fs,res.cco$Gp)
plot(Z[,1],Z[,2],type="n",xlim=c(-1,1),ylim=c(-1,1),asp=1)
arrows(0,0,Z[1:3,1],Z[1:3,2],col="red")
arrows(0,0,Z[4:6,1],Z[4:6,2],col="blue")
text(res.cco$Fs[,1],res.cco$Fs[,2],
     c(expression(X[1]),expression(X[2]),expression(X[3])))
text(res.cco$Gp[,1],res.cco$Gp[,2],
     c(expression(Y[1]),expression(Y[2]),expression(Y[3])),pos=c(4,3,1))
grid()
fa <- 0.15
points(fa*res.cco$U[,1],fa*res.cco$U[,2])

par(mfg=c(1,2))
#
# Figure B
#

Z <- rbind(res.cco$Fp,res.cco$Gs)
plot(Z[,1],Z[,2],type="n",xlim=c(-1.5,1.5),ylim=c(-1.5,1.5),asp=1)
arrows(0,0,Z[1:3,1],Z[1:3,2],col="red")
arrows(0,0,Z[4:6,1],Z[4:6,2],col="blue")
text(res.cco$Fp[,1],res.cco$Fp[,2],
     c(expression(X[1]),expression(X[2]),expression(X[3])))
text(res.cco$Gs[,1],res.cco$Gs[,2],
     c(expression(Y[1]),expression(Y[2]),expression(Y[3])),pos=c(4,3,1))
grid()
fa <- 0.25
points(fa*res.cco$V[,1],fa*res.cco$V[,2])

par(mfg=c(2,1))
#
# Standardizing the transformed data
#

Xstan.clr <- scale(Xsub.clr)
Ystan.clr <- scale(Ysub.clr)
res.stan.cco <- canocov(Xstan.clr,Ystan.clr)

#
# Figure C
#

Z <- rbind(res.stan.cco$Fs,res.stan.cco$Gp)
plot(Z[,1],Z[,2],type="n",xlim=c(-1,1),ylim=c(-1,1),asp=1)
arrows(0,0,Z[1:3,1],Z[1:3,2],col="red")
arrows(0,0,Z[4:6,1],Z[4:6,2],col="blue")
text(res.stan.cco$Fs[,1],res.stan.cco$Fs[,2],
     c(expression(X[1]),expression(X[2]),expression(X[3])))
text(res.stan.cco$Gp[,1],res.stan.cco$Gp[,2],
     c(expression(Y[1]),expression(Y[2]),expression(Y[3])),pos=c(4,3,1))
grid()
fa <- 0.2
points(fa*res.stan.cco$U[,1],fa*res.stan.cco$U[,2])
circle()

par(mfg=c(2,2))
#
# Figure D
#

Z <- rbind(res.stan.cco$Fp,res.stan.cco$Gs)
plot(Z[,1],Z[,2],type="n",xlim=c(-1.5,1.5),ylim=c(-1.5,1.5),asp=1)
arrows(0,0,Z[1:3,1],Z[1:3,2],col="red")
arrows(0,0,Z[4:6,1],Z[4:6,2],col="blue")
text(res.stan.cco$Fp[,1],res.stan.cco$Fp[,2],
     c(expression(X[1]),expression(X[2]),expression(X[3])))
text(res.stan.cco$Gs[,1],res.stan.cco$Gs[,2],
     c(expression(Y[1]),expression(Y[2]),expression(Y[3])),pos=c(4,3,1))
grid()
fa <- 0.25
points(fa*res.stan.cco$V[,1],fa*res.stan.cco$V[,2])
circle()
par(opar)


###################################################
### code chunk number 14: ToolsForCoDa.Rnw:271-350
###################################################

opar <- par(mfrow=c(2,2),mar=c(3,3,2,0)+0.5,mgp=c(2,1,0))
par(mfg=c(1,1))
#
# Figure A
#
Z <- rbind(res.cco$Fs,res.cco$Gp)
plot(Z[,1],Z[,2],type="n",xlim=c(-1,1),ylim=c(-1,1),asp=1)
arrows(0,0,Z[1:3,1],Z[1:3,2],col="red")
arrows(0,0,Z[4:6,1],Z[4:6,2],col="blue")
text(res.cco$Fs[,1],res.cco$Fs[,2],
     c(expression(X[1]),expression(X[2]),expression(X[3])))
text(res.cco$Gp[,1],res.cco$Gp[,2],
     c(expression(Y[1]),expression(Y[2]),expression(Y[3])),pos=c(4,3,1))
grid()
fa <- 0.15
points(fa*res.cco$U[,1],fa*res.cco$U[,2])

par(mfg=c(1,2))
#
# Figure B
#

Z <- rbind(res.cco$Fp,res.cco$Gs)
plot(Z[,1],Z[,2],type="n",xlim=c(-1.5,1.5),ylim=c(-1.5,1.5),asp=1)
arrows(0,0,Z[1:3,1],Z[1:3,2],col="red")
arrows(0,0,Z[4:6,1],Z[4:6,2],col="blue")
text(res.cco$Fp[,1],res.cco$Fp[,2],
     c(expression(X[1]),expression(X[2]),expression(X[3])))
text(res.cco$Gs[,1],res.cco$Gs[,2],
     c(expression(Y[1]),expression(Y[2]),expression(Y[3])),pos=c(4,3,1))
grid()
fa <- 0.25
points(fa*res.cco$V[,1],fa*res.cco$V[,2])

par(mfg=c(2,1))
#
# Standardizing the transformed data
#

Xstan.clr <- scale(Xsub.clr)
Ystan.clr <- scale(Ysub.clr)
res.stan.cco <- canocov(Xstan.clr,Ystan.clr)

#
# Figure C
#

Z <- rbind(res.stan.cco$Fs,res.stan.cco$Gp)
plot(Z[,1],Z[,2],type="n",xlim=c(-1,1),ylim=c(-1,1),asp=1)
arrows(0,0,Z[1:3,1],Z[1:3,2],col="red")
arrows(0,0,Z[4:6,1],Z[4:6,2],col="blue")
text(res.stan.cco$Fs[,1],res.stan.cco$Fs[,2],
     c(expression(X[1]),expression(X[2]),expression(X[3])))
text(res.stan.cco$Gp[,1],res.stan.cco$Gp[,2],
     c(expression(Y[1]),expression(Y[2]),expression(Y[3])),pos=c(4,3,1))
grid()
fa <- 0.2
points(fa*res.stan.cco$U[,1],fa*res.stan.cco$U[,2])
circle()

par(mfg=c(2,2))
#
# Figure D
#

Z <- rbind(res.stan.cco$Fp,res.stan.cco$Gs)
plot(Z[,1],Z[,2],type="n",xlim=c(-1.5,1.5),ylim=c(-1.5,1.5),asp=1)
arrows(0,0,Z[1:3,1],Z[1:3,2],col="red")
arrows(0,0,Z[4:6,1],Z[4:6,2],col="blue")
text(res.stan.cco$Fp[,1],res.stan.cco$Fp[,2],
     c(expression(X[1]),expression(X[2]),expression(X[3])))
text(res.stan.cco$Gs[,1],res.stan.cco$Gs[,2],
     c(expression(Y[1]),expression(Y[2]),expression(Y[3])),pos=c(4,3,1))
grid()
fa <- 0.25
points(fa*res.stan.cco$V[,1],fa*res.stan.cco$V[,2])
circle()
par(opar)


