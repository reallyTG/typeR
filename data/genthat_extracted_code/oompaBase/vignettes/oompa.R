### R code from vignette source 'oompa.Rnw'

###################################################
### code chunk number 1: invoke
###################################################
library(oompaBase)


###################################################
### code chunk number 2: data
###################################################
mat <- matrix(1:1024, ncol=1)


###################################################
### code chunk number 3: figmaker (eval = FALSE)
###################################################
## # windows(width=6,height=8)
## opar <- par(mfrow=c(6, 1), mai=c(0.3, 0.5, 0.2, 0.2))
## image(mat, col=redgreen(64), main='redgreen')
## image(mat, col=jetColors(128), main='jetColors')
## image(mat, col=blueyellow(32), main='blueyellow')
## image(mat, col=redscale(64), main='redscale')
## image(mat, col=bluescale(64), main='bluescale')
## image(mat, col=greyscale(64), main='greyscale')
## par(opar)


###################################################
### code chunk number 4: oompa.Rnw:66-67
###################################################
# windows(width=6,height=8)
opar <- par(mfrow=c(6, 1), mai=c(0.3, 0.5, 0.2, 0.2))
image(mat, col=redgreen(64), main='redgreen')
image(mat, col=jetColors(128), main='jetColors')
image(mat, col=blueyellow(32), main='blueyellow')
image(mat, col=redscale(64), main='redscale')
image(mat, col=bluescale(64), main='bluescale')
image(mat, col=greyscale(64), main='greyscale')
par(opar)


###################################################
### code chunk number 5: dat
###################################################
ng <- 10000
ns <- 50
dat <- matrix(rnorm(ng*ns, 0, rep(c(1, 2), each=25)), ncol=ns, byrow=TRUE)


###################################################
### code chunk number 6: dat
###################################################
dat[1:500, 1:25] <- dat[1:500, 1:25] + 2


###################################################
### code chunk number 7: clas
###################################################
clas <- factor(rep(c('Good', 'Bad'), each=25))


###################################################
### code chunk number 8: mm
###################################################
a0 <- proc.time()
myMean <- matrixMean(dat)
used0 <- proc.time() - a0


###################################################
### code chunk number 9: checkApply
###################################################
a1 <- proc.time()
mm <- apply(dat, 1, mean)
used1 <- proc.time() - a1


###################################################
### code chunk number 10: nodiff
###################################################
summary(as.vector(myMean-mm))


###################################################
### code chunk number 11: times
###################################################
used0
used1


###################################################
### code chunk number 12: varns
###################################################
a0 <- proc.time()
myVar  <- matrixVar(dat, myMean)
a1 <- proc.time()
vv <- apply(dat, 1, var)
a2 <- proc.time()


###################################################
### code chunk number 13: nodiffv
###################################################
summary(as.vector(myVar - vv))


###################################################
### code chunk number 14: timers
###################################################
a1 - a0
a2 - a1


###################################################
### code chunk number 15: tstats
###################################################
t0 <- proc.time()
myT <- matrixT(dat, clas)
t1 <- proc.time()
tt <- sapply(1:nrow(dat), function(i) {
  t.test(dat[i,clas=="Bad"], dat[i, clas=="Good"], var.equal=T)$statistic
})
t2 <- proc.time()


###################################################
### code chunk number 16: oompa.Rnw:150-151
###################################################
summary(as.vector(tt - myT))


###################################################
### code chunk number 17: oompa.Rnw:153-155
###################################################
t1 - t0
t2 - t1


###################################################
### code chunk number 18: xy
###################################################
x <- matrix(rnorm(100*3), nrow=100, ncol=3)
class1 <- class2<- rep(FALSE, 100)
class1[sample(100, 20)] <- TRUE
class2[sample(100, 20)] <- TRUE
class3 <- !(class1 | class2)
codes <- list(ColorCoding(class1, "red", 16),
              ColorCoding(class2, "blue", 15),
              ColorCoding(class3, "black", 17))


###################################################
### code chunk number 19: pcc
###################################################
par(mfrow=c(2,1))
plot(ColorCodedPair(x[,1], x[,2], codes), xlab="Coord1", ylab="Coord2")
plot(ColorCodedPair(x[,1], x[,3], codes), xlab="Coord1", ylab="Coord3")
par(mfrow=c(1,1))


