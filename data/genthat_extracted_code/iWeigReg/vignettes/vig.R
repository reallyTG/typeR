### R code from vignette source 'vig.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: read.data
###################################################
library(iWeigReg)

data(KS.data)
attach(KS.data)


###################################################
### code chunk number 2: vig.Rnw:88-89
###################################################
KS.data[1:3,]


###################################################
### code chunk number 3: vig.Rnw:94-97
###################################################
n=1000
z=cbind(z1,z2,z3,z4)
x=cbind(x1,x2,x3,x4)


###################################################
### code chunk number 4: vig.Rnw:104-108
###################################################
ppi.glm <- glm(tr~x, family=binomial(link=logit))

X <- model.matrix(ppi.glm)
ppi.hat <- ppi.glm$fitted


###################################################
### code chunk number 5: vig.Rnw:113-124
###################################################
y.fam <- gaussian(link=identity)

eta1.glm <- glm(y ~ z, subset=tr==1, 
               family=y.fam, control=glm.control(maxit=1000))
eta1.hat <- predict.glm(eta1.glm, 
               newdata=data.frame(z=z), type="response")

eta0.glm <- glm(y ~ z, subset=tr==0, 
               family=y.fam, control=glm.control(maxit=1000))
eta0.hat <- predict.glm(eta0.glm, 
               newdata=data.frame(z=z), type="response")


###################################################
### code chunk number 6: vig.Rnw:138-140
###################################################
out.HT <- ate.HT(z, tr, ppi.hat, X, bal=TRUE)
out.HT$mu


###################################################
### code chunk number 7: vig.Rnw:145-146
###################################################
out.HT$mu/ sqrt(out.HT$v)


###################################################
### code chunk number 8: vig.Rnw:152-198
###################################################
gp1 <- tr==1
gp0 <- tr==0

out.clik <- ate.clik(y, tr, ppi.hat, 
               g0=cbind(1,eta0.hat),g1=cbind(1,eta1.hat))

par(mfrow=c(2,3))
look <- z1

histw(look[gp1], rep(1,sum(gp1)), xaxis=seq(-3.5,3.5,.25),
    xmin=-3.5, xmax=3.5, ymax=.8)
histw(look[gp0], rep(1,sum(gp0)), xaxis=seq(-3.5,3.5,.25), 
    xmin=-3.5, xmax=3.5, ymax=.8, bar=0, add=TRUE, col="red")
title(main="unweighted", ylab="z1")

histw(look[gp1], 1/ppi.hat[gp1], xaxis=seq(-3.5,3.5,.25), 
    xmin=-3.5, xmax=3.5, ymax=.8)
histw(look[gp0], 1/(1-ppi.hat[gp0]), xaxis=seq(-3.5,3.5,.25), 
    xmin=-3.5, xmax=3.5, ymax=.8, bar=0, add=TRUE, col="red")
title(main="HT weighted", ylab="z1")

histw(look[gp1], 1/out.clik$w[gp1,1], xaxis=seq(-3.5,3.5,.25), 
    xmin=-3.5, xmax=3.5, ymax=.8)
histw(look[gp0], 1/out.clik$w[gp0,2], xaxis=seq(-3.5,3.5,.25), 
    xmin=-3.5, xmax=3.5, ymax=.8, bar=0, add=TRUE, col="red")
title(main="clik weighted", ylab="z1")

look <- z2

histw(look[gp1], rep(1,sum(gp1)), xaxis=seq(-3.5,3.5,.25),
    xmin=-3.5, xmax=3.5, ymax=.8)
histw(look[gp0], rep(1,sum(gp0)), xaxis=seq(-3.5,3.5,.25), 
    xmin=-3.5, xmax=3.5, ymax=.8, bar=0, add=TRUE, col="red")
title(main="unweighted", ylab="z2")

histw(look[gp1], 1/ppi.hat[gp1], xaxis=seq(-3.5,3.5,.25), 
    xmin=-3.5, xmax=3.5, ymax=.8)
histw(look[gp0], 1/(1-ppi.hat[gp0]), xaxis=seq(-3.5,3.5,.25), 
    xmin=-3.5, xmax=3.5, ymax=.8, bar=0, add=TRUE, col="red")
title(main="HT weighted", ylab="z2")

histw(look[gp1], 1/out.clik$w[gp1,1], xaxis=seq(-3.5,3.5,.25), 
    xmin=-3.5, xmax=3.5, ymax=.8)
histw(look[gp0], 1/out.clik$w[gp0,2], xaxis=seq(-3.5,3.5,.25), 
    xmin=-3.5, xmax=3.5, ymax=.8, bar=0, add=TRUE, col="red")
title(main="clik weighted", ylab="z2")


###################################################
### code chunk number 9: vig.Rnw:205-222
###################################################
gp1 <- tr==1
gp0 <- tr==0

par(mfrow=c(2,3))
look <- z1

histw(look[gp1], rep(1,sum(gp1)), xaxis=seq(-3.5,3.5,.25),
    xmin=-3.5, xmax=3.5, ymax=.8)
histw(look[gp0], rep(1,sum(gp0)), xaxis=seq(-3.5,3.5,.25), 
    xmin=-3.5, xmax=3.5, ymax=.8, bar=0, add=TRUE, col="red")
title(main="unweighted", ylab="z1")

histw(look[gp1], 1/ppi.hat[gp1], xaxis=seq(-3.5,3.5,.25), 
    xmin=-3.5, xmax=3.5, ymax=.8)
histw(look[gp0], 1/(1-ppi.hat[gp0]), xaxis=seq(-3.5,3.5,.25), 
    xmin=-3.5, xmax=3.5, ymax=.8, bar=0, add=TRUE, col="red")
title(main="HT weighted", ylab="z1")


###################################################
### code chunk number 10: vig.Rnw:229-231
###################################################
out.clik <- ate.clik(y, tr, ppi.hat, 
               g0=cbind(1,eta0.hat),g1=cbind(1,eta1.hat))


###################################################
### code chunk number 11: vig.Rnw:237-244
###################################################
look <- z1

histw(look[gp1], 1/out.clik$w[gp1,1], xaxis=seq(-3.5,3.5,.25), 
    xmin=-3.5, xmax=3.5, ymax=.8)
histw(look[gp0], 1/out.clik$w[gp0,2], xaxis=seq(-3.5,3.5,.25), 
    xmin=-3.5, xmax=3.5, ymax=.8, bar=0, add=TRUE, col="red")
title(main="clik weighted", ylab="z1")


###################################################
### code chunk number 12: vig.Rnw:249-251
###################################################
out.clik$mu
sqrt(out.clik$v)


###################################################
### code chunk number 13: vig.Rnw:256-258
###################################################
out.clik$diff
sqrt(out.clik$v.diff)


###################################################
### code chunk number 14: vig.Rnw:263-265
###################################################
out.clik2 <- ate.clik(y, tr, ppi.hat, 
               g0=cbind(1,z),g1=cbind(1,z))


###################################################
### code chunk number 15: vig.Rnw:270-273
###################################################
apply(z, 2, mean)
apply(z[gp1,]/out.clik2$w[gp1,1], 2, sum)/n
apply(z[gp0,]/out.clik2$w[gp0,2], 2, sum)/n


###################################################
### code chunk number 16: vig.Rnw:279-288
###################################################
eta1.glm <- glm(y ~ x, subset=tr==1, 
               family=y.fam, control=glm.control(maxit=1000))
eta1.hat <- predict.glm(eta1.glm, 
               newdata=data.frame(x=x), type="response")

eta0.glm <- glm(y ~ x, subset=tr==0, 
               family=y.fam, control=glm.control(maxit=1000))
eta0.hat <- predict.glm(eta0.glm, 
               newdata=data.frame(x=x), type="response")


###################################################
### code chunk number 17: vig.Rnw:293-295
###################################################
out.clik <- ate.clik(y, tr, ppi.hat, 
               g0=cbind(1,eta0.hat),g1=cbind(1,eta1.hat))


###################################################
### code chunk number 18: vig.Rnw:303-343
###################################################
par(mfrow=c(2,3))
look <- z1

histw(look[gp1], rep(1,sum(gp1)), xaxis=seq(-3.5,3.5,.25),
    xmin=-3.5, xmax=3.5, ymax=.8)
histw(look[gp0], rep(1,sum(gp0)), xaxis=seq(-3.5,3.5,.25), 
    xmin=-3.5, xmax=3.5, ymax=.8, bar=0, add=TRUE, col="red")
title(main="unweighted", ylab="z1")

histw(look[gp1], 1/ppi.hat[gp1], xaxis=seq(-3.5,3.5,.25), 
    xmin=-3.5, xmax=3.5, ymax=.8)
histw(look[gp0], 1/(1-ppi.hat[gp0]), xaxis=seq(-3.5,3.5,.25), 
    xmin=-3.5, xmax=3.5, ymax=.8, bar=0, add=TRUE, col="red")
title(main="HT weighted", ylab="z1")

histw(look[gp1], 1/out.clik$w[gp1,1], xaxis=seq(-3.5,3.5,.25), 
    xmin=-3.5, xmax=3.5, ymax=.8)
histw(look[gp0], 1/out.clik$w[gp0,2], xaxis=seq(-3.5,3.5,.25), 
    xmin=-3.5, xmax=3.5, ymax=.8, bar=0, add=TRUE, col="red")
title(main="clik weighted", ylab="z1")

look <- z2

histw(look[gp1], rep(1,sum(gp1)), xaxis=seq(-3.5,3.5,.25),
    xmin=-3.5, xmax=3.5, ymax=.8)
histw(look[gp0], rep(1,sum(gp0)), xaxis=seq(-3.5,3.5,.25), 
    xmin=-3.5, xmax=3.5, ymax=.8, bar=0, add=TRUE, col="red")
title(main="unweighted", ylab="z2")

histw(look[gp1], 1/ppi.hat[gp1], xaxis=seq(-3.5,3.5,.25), 
    xmin=-3.5, xmax=3.5, ymax=.8)
histw(look[gp0], 1/(1-ppi.hat[gp0]), xaxis=seq(-3.5,3.5,.25), 
    xmin=-3.5, xmax=3.5, ymax=.8, bar=0, add=TRUE, col="red")
title(main="HT weighted", ylab="z2")

histw(look[gp1], 1/out.clik$w[gp1,1], xaxis=seq(-3.5,3.5,.25), 
    xmin=-3.5, xmax=3.5, ymax=.8)
histw(look[gp0], 1/out.clik$w[gp0,2], xaxis=seq(-3.5,3.5,.25), 
    xmin=-3.5, xmax=3.5, ymax=.8, bar=0, add=TRUE, col="red")
title(main="clik weighted", ylab="z2")


