### R code from vignette source 'RCAL-vig.Rnw'
### Encoding: ISO8859-1

###################################################
### code chunk number 1: read.data
###################################################
library(RCAL)

data(simu.data)


###################################################
### code chunk number 2: RCAL-vig.Rnw:90-91
###################################################
simu.data[1:10, 1:6]


###################################################
### code chunk number 3: RCAL-vig.Rnw:97-104
###################################################
n <- dim(simu.data)[1]
p <- dim(simu.data)[2]-2

y <- simu.data[,1]
tr <- simu.data[,2]
x <- simu.data[,2+1:p]
x <- scale(x)


###################################################
### code chunk number 4: RCAL-vig.Rnw:114-119
###################################################
par(mfrow=c(3,2))
par(mar=c(4,4,2,2))
for (j in 1:6) {
  boxplot(x[,j] ~ tr, ylab=paste("covariate x", j, sep=""), xlab="treatment")
}


###################################################
### code chunk number 5: RCAL-vig.Rnw:130-135
###################################################
par(mfrow=c(3,2))
par(mar=c(4,4,2,2))
for (j in 1:6) {
  plot(x[tr==1,j], y[tr==1], ylab="y", xlab=paste("covariate x", j, sep=""))
}


###################################################
### code chunk number 6: RCAL-vig.Rnw:156-158
###################################################
mean(y[tr==1])   # point estimate
sqrt(var(y[tr==1]) / sum(tr) )   # standard error 


###################################################
### code chunk number 7: RCAL-vig.Rnw:175-190
###################################################
## regularized calibrated estimation
set.seed(0)   #this affects random split of data in cross validation
mn.cv.rcal <- 
mn.regu.cv(fold=5*c(1,1), nrho=(1+10)*c(1,1), rho.seq=NULL, y, tr, x,
           ploss="cal", yloss="gaus")
unlist(mn.cv.rcal$est) 
sqrt(mn.cv.rcal$est $var)

## regularized maximum likelihood estimation
set.seed(0)   #this affects random split of data in cross validation
mn.cv.rml <- 
mn.regu.cv(fold=5*c(1,1), nrho=(1+10)*c(1,1), rho.seq=NULL, y, tr, x,
           ploss="ml", yloss="gaus")
unlist(mn.cv.rml$est)
sqrt(mn.cv.rml$est $var)


###################################################
### code chunk number 8: RCAL-vig.Rnw:197-227
###################################################
## regularized calibrated estimation
set.seed(0)
ps.cv.rcal <- 
glm.regu.cv(fold=5, nrho=1+10, y=tr, x=x, loss="cal")
ps.cv.rcal$sel.nz[1]
fp.cv.rcal <- ps.cv.rcal $sel.fit[,1]

or.cv.rcal <- 
glm.regu.cv(fold=5, nrho=1+10, y=y[tr==1], x=x[tr==1,], 
            iw=1/fp.cv.rcal[tr==1]-1, loss="gaus")
fo.cv.rcal <- c( cbind(1,x)%*%or.cv.rcal$sel.bet[,1] )

mn.cv.rcal2 <- unlist(mn.aipw(y, tr, fp=fp.cv.rcal, fo=fo.cv.rcal))
mn.cv.rcal2

## regularized maximum likelihood estimation
set.seed(0)

ps.cv.rml <- 
glm.regu.cv(fold=5, nrho=1+10, y=tr, x=x, loss="ml")
ps.cv.rml$sel.nz[1]
fp.cv.rml <- ps.cv.rml $sel.fit[,1]

or.cv.rml <- 
glm.regu.cv(fold=5, nrho=1+10, y=y[tr==1], x=x[tr==1,], 
            iw=NULL, loss="gaus")
fo.cv.rml <- c( cbind(1,x)%*%or.cv.rml$sel.bet[,1] )

mn.cv.rml2 <- unlist(mn.aipw(y, tr, fp=fp.cv.rml, fo=fo.cv.rml))
mn.cv.rml2


###################################################
### code chunk number 9: RCAL-vig.Rnw:248-274
###################################################
fp.raw <- rep(mean(tr), n)   #constant propensity scores
check.raw <- mn.ipw(x, tr, fp.raw)

check.cv.rcal <- mn.ipw(x, tr, fp.cv.rcal)

check.cv.rml <- mn.ipw(x, tr, fp.cv.rml)

par(mfrow=c(2,2))
par(mar=c(4,4,2,2))
plot(check.raw$est, xlim=c(0,p), ylim=c(-.3,.3), 
     xlab="", ylab="std diff", main="Raw") 
abline(h=0)

plot(check.cv.rml$est, xlim=c(0,p), ylim=c(-.3,.3), 
     xlab="", ylab="std diff", main="RML") 
abline(h=0)
abline(h=max(abs(check.cv.rml$est)) *c(-1,1), lty=2)

plot(check.cv.rcal$est, xlim=c(0,p), ylim=c(-.3,.3), 
     xlab="", ylab="std diff", main="RCAL") 
abline(h=0)
abline(h=max(abs(check.cv.rcal$est)) *c(-1,1), lty=2)

plot(fp.cv.rml[tr==1], fp.cv.rcal[tr==1], xlim=c(0,1), ylim=c(0,1), 
     xlab="RML", ylab="RCAL", main="fitted probabilities")
abline(c(0,1))


###################################################
### code chunk number 10: RCAL-vig.Rnw:281-300
###################################################
par(mfrow=c(2,2))
par(mar=c(4,4,2,2))
plot(check.raw$est, xlim=c(0,p), ylim=c(-.3,.3), 
     xlab="", ylab="std diff", main="Raw") 
abline(h=0)

plot(check.cv.rml$est, xlim=c(0,p), ylim=c(-.3,.3), 
     xlab="", ylab="std diff", main="RML") 
abline(h=0)
abline(h=max(abs(check.cv.rml$est)) *c(-1,1), lty=2)

plot(check.cv.rcal$est, xlim=c(0,p), ylim=c(-.3,.3), 
     xlab="", ylab="std diff", main="RCAL") 
abline(h=0)
abline(h=max(abs(check.cv.rcal$est)) *c(-1,1), lty=2)

plot(fp.cv.rml[tr==1], fp.cv.rcal[tr==1], xlim=c(0,1), ylim=c(0,1), 
     xlab="RML", ylab="RCAL", main="fitted probabilities")
abline(c(0,1))


###################################################
### code chunk number 11: RCAL-vig.Rnw:315-342
###################################################
set.seed(0)
ps.path.rcal <- 
glm.regu.path(nrho=1+10, rho.seq=NULL, y=tr, x=x, loss="cal")
fp.path.rcal <- ps.path.rcal $fit.all[, !ps.path.rcal$non.conv]

mdiff.path.rcal <- rep(NA, dim(fp.path.rcal)[2])
rvar.path.rcal <- rep(NA, dim(fp.path.rcal)[2])
for (j in 1:dim(fp.path.rcal)[2]) {
  check.path.rcal <- mn.ipw(x, tr, fp.path.rcal[,j])
  mdiff.path.rcal[j] <- max(abs(check.path.rcal$est))
  rvar.path.rcal[j] <- 
  var(1/fp.path.rcal[tr==1,j])/mean(1/fp.path.rcal[tr==1,j])^2
}

set.seed(0)
ps.path.rml <- 
glm.regu.path(nrho=1+10, rho.seq=NULL, y=tr, x=x, loss="ml")
fp.path.rml <- ps.path.rml $fit.all[, !ps.path.rml$non.conv]

mdiff.path.rml <- rep(NA, dim(fp.path.rml)[2])
rvar.path.rml <- rep(NA, dim(fp.path.rml)[2])
for (j in 1:dim(fp.path.rml)[2]) {
  check.path.rml <- mn.ipw(x, tr, fp.path.rml[,j])
  mdiff.path.rml[j] <- max(abs(check.path.rml$est))
  rvar.path.rml[j] <- 
  var(1/fp.path.rml[tr==1,j])/mean(1/fp.path.rml[tr==1,j])^2
}


###################################################
### code chunk number 12: RCAL-vig.Rnw:349-369
###################################################
par(mfrow=c(1,2))
par(mar=c(4,4,2,2))
plot(ps.path.rml$nz.all[!ps.path.rml$non.conv], mdiff.path.rml, 
     xlim=c(0,p), ylim=c(0,.3), xlab="# nonzero", ylab="std diff")
lines(ps.path.rml$nz.all[!ps.path.rml$non.conv], mdiff.path.rml, lty=3)

points(ps.path.rcal$nz.all[!ps.path.rcal$non.conv], mdiff.path.rcal, pch=4)
lines(ps.path.rcal$nz.all[!ps.path.rcal$non.conv], mdiff.path.rcal, lty=3)

legend(120,.3, c("RML","RCAL"), pch=c(1,4), cex=.6)

#
plot(rvar.path.rml, mdiff.path.rml, 
     xlim=c(0,1.5), ylim=c(0,.3), xlab="rel var", ylab="std diff")
lines(rvar.path.rml, mdiff.path.rml, lty=3)

points(rvar.path.rcal, mdiff.path.rcal, pch=4)
lines(rvar.path.rcal, mdiff.path.rcal, lty=3)

legend(1.0,.3, c("RML","RCAL"), pch=c(1,4), cex=.6)


###################################################
### code chunk number 13: RCAL-vig.Rnw:379-397
###################################################
## regularized calibrated estimation
set.seed(0)
ate.cv.rcal <- 
ate.regu.cv(fold=5*c(1,1), nrho=(1+10)*c(1,1), rho.seq=NULL, y, tr, x,
            ploss="cal", yloss="gaus")
matrix(unlist(ate.cv.rcal$est), ncol=2, byrow=T, 
dimnames=list(c("one", "ipw", "or", "est", "var", "ze", 
"diff.est", "diff.var", "diff.ze"), c("untreated", "treated")))


## regularized maximum likelihood estimation
set.seed(0)
ate.cv.rml <- 
ate.regu.cv(fold=5*c(1,1), nrho=(1+10)*c(1,1), rho.seq=NULL, y, tr, x,
            ploss="ml", yloss="gaus")
matrix(unlist(ate.cv.rml$est), ncol=2, byrow=T, 
dimnames=list(c("one", "ipw", "or", "est", "var", "ze", 
"diff.est", "diff.var", "diff.ze"), c("untreated", "treated")))


