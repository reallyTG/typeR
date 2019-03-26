library(SECP)


### Name: fdc2s
### Title: Mass fractal dimension of a 2D cluster
### Aliases: fdc2s

### ** Examples

# # # # # # # # # # # # # # # # #
# Example 1: Isotropic set cover
# # # # # # # # # # # # # # # # #
pc <- .592746
p1 <- pc - .03
p2 <- pc + .03
lx <- 33; ss <- (lx+1)/2
set.seed(20120627); ac1 <- ssi20(x=lx, p=p1)
set.seed(20120627); ac2 <- ssi20(x=lx, p=p2)
bnd <- isc2s(k=9, x=dim(ac1))
fd1 <- fdc2s(acc=ac1, bnd=bnd)
fd2 <- fdc2s(acc=ac2, bnd=bnd)
n1 <- fd1$model[,"n"]; n2 <- fd2$model[,"n"]
r1 <- fd1$model[,"r"]; r2 <- fd2$model[,"r"]
rr <- seq(min(r1)-.2, max(r1)+.2, length=100)
nn1 <- predict(fd1, newdata=list(r=rr), interval="conf")
nn2 <- predict(fd2, newdata=list(r=rr), interval="conf")
s1 <- paste(round(confint(fd1)[2,], digits=3), collapse=", ")
s2 <- paste(round(confint(fd2)[2,], digits=3), collapse=", ")
x <- y <- seq(lx)
par(mfrow=c(2,2), mar=c(3,3,3,1), mgp=c(2,1,0))
image(x, y, ac1, cex.main=1,
      main=paste("Isotropic set cover and a 2D cluster of\n",
                 "sites with (1,0)-neighborhood and p=",
                 round(p1, digits=3), sep=""))
rect(bnd["x1",], bnd["y1",], bnd["x2",], bnd["y2",])
abline(h=ss, lty=2); abline(v=ss, lty=2)
image(x, y, ac2, cex.main=1,
      main=paste("Isotropic set cover and a 2D cluster of\n",
                 "sites with (1,0)-neighborhood and p=",
                 round(p2, digits=3), sep=""))
rect(bnd["x1",], bnd["y1",], bnd["x2",], bnd["y2",])
abline(h=ss, lty=2); abline(v=ss, lty=2)
plot(r1, n1, pch=3, ylim=range(c(n1,n2)), cex.main=1,
     main=paste("0.95 confidence interval for the mass\n", 
                "fractal dimension is (",s1,")", sep=""))
matlines(rr, nn1, lty=c(1,2,2), col=c("black","red","red"))
plot(r2, n2, pch=3, ylim=range(c(n1,n2)), cex.main=1,
     main=paste("0.95 confidence interval for the mass\n", 
                "fractal dimension is (",s2,")", sep=""))
matlines(rr, nn2, lty=c(1,2,2), col=c("black","red","red"))

# # # # # # # # # # # # # # # # #
# Example 1: Anisotropic set cover, dir=2
# # # # # # # # # # # # # # # # #
pc <- .592746
p1 <- pc - .03
p2 <- pc + .03
lx <- 33; ss <- (lx+1)/2; ssy <- seq(lx+2, 2*lx-1)
set.seed(20120627); ac1 <- ssi20(x=lx, p=p1, set=ssy, all=FALSE)
set.seed(20120627); ac2 <- ssi20(x=lx, p=p2, set=ssy, all=FALSE)
bnd <- asc2s(k=9, x=dim(ac1), dir=2)
fd1 <- fdc2s(acc=ac1, bnd=bnd)
fd2 <- fdc2s(acc=ac2, bnd=bnd)
n1 <- fd1$model[,"n"]; n2 <- fd2$model[,"n"]
r1 <- fd1$model[,"r"]; r2 <- fd2$model[,"r"]
rr <- seq(min(r1)-.2, max(r1)+.2, length=100)
nn1 <- predict(fd1, newdata=list(r=rr), interval="conf")
nn2 <- predict(fd2, newdata=list(r=rr), interval="conf")
s1 <- paste(round(confint(fd1)[2,], digits=3), collapse=", ")
s2 <- paste(round(confint(fd2)[2,], digits=3), collapse=", ")
x <- y <- seq(lx)
par(mfrow=c(2,2), mar=c(3,3,3,1), mgp=c(2,1,0))
image(x, y, ac1, cex.main=1,
      main=paste("Anisotropic set cover and a 2D cluster of\n",
                 "sites with (1,0)-neighborhood and p=",
                 round(p1, digits=3), sep=""))
rect(bnd["x1",], bnd["y1",], bnd["x2",], bnd["y2",])
abline(v=ss, lty=2)
image(x, y, ac2, cex.main=1,
      main=paste("Anisotropic set cover and a 2D cluster of\n",
                 "sites with (1,0)-neighborhood and p=",
                 round(p2, digits=3), sep=""))
rect(bnd["x1",], bnd["y1",], bnd["x2",], bnd["y2",])
abline(v=ss, lty=2)
plot(r1, n1, pch=3, ylim=range(c(n1,n2)), cex.main=1,
     main=paste("0.95 confidence interval for the mass\n", 
                "fractal dimension is (",s1,")", sep=""))
matlines(rr, nn1, lty=c(1,2,2), col=c("black","red","red"))
plot(r2, n2, pch=3, ylim=range(c(n1,n2)), cex.main=1,
     main=paste("0.95 confidence interval for the mass\n", 
                "fractal dimension is (",s2,")", sep=""))
matlines(rr, nn2, lty=c(1,2,2), col=c("black","red","red"))



