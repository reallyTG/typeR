library(DiscreteLaplace)


### Name: estdlaplace2
### Title: Sample estimation for the ADSL
### Aliases: estdlaplace2
### Keywords: distribution,htest

### ** Examples

p <- 0.4
q <- 0.6
x <- rdlaplace2(n=100, p, q)
est <- matrix(0, 5, 2)
est[1,] <- c(p,q)
est[2,] <- estdlaplace2(x, method="M")
est[3,] <- estdlaplace2(x, method="ML")
est[4,] <- estdlaplace2(x, method="P")
est[5,] <- estdlaplace2(x, method="MM")
dimnames(est)[[1]]<-c("true","M","ML","P","MM")
dimnames(est)[[2]]<-c("p","q")
xlim <- c(min(est[,1])*.98,max(est[,1])*1.02)
ylim <- c(min(est[,2])*.98,max(est[,2])*1.02)
plot(est, pch=19, col=1:5, xlim=xlim, ylim=ylim)
text(est, dimnames(est)[[1]], pos=3, col=1:5, cex= .75)



