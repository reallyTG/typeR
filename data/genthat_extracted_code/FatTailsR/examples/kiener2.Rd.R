library(FatTailsR)


### Name: kiener2
### Title: Asymmetric Kiener Distribution K2
### Aliases: kiener2 dkiener2 pkiener2 qkiener2 rkiener2 dpkiener2
###   dqkiener2 lkiener2 dlkiener2 qlkiener2 varkiener2 ltmkiener2
###   rtmkiener2 dtmqkiener2 eskiener2

### ** Examples


require(graphics)

### Example 1
pp <- c(ppoints(11, a = 1), NA, NaN) ; pp
lp <- logit(pp) ; lp
qkiener2(  p = pp, m = 2, g = 1.5, a = 4, w = 6)
qkiener2(  p = pp, m = 2, g = 1.5, a = 4, w = 6)
qlkiener2(lp = lp, m = 2, g = 1.5, a = 4, w = 6)
dpkiener2( p = pp, m = 2, g = 1.5, a = 4, w = 6)
dlkiener2(lp = lp, m = 2, g = 1.5, a = 4, w = 6)
dqkiener2( p = pp, m = 2, g = 1.5, a = 4, w = 6)


### Example 2
a       <- 6
w       <- 4
set.seed(2014)
mainTC  <- paste("qkiener2(p, m = 0, g = 1, a = ", a, ", w = ", w, ")")
mainsum <- paste("cumulated qkiener2(p, m = 0, g = 1, a = ", a, ", w = ", w, ")")
T       <- 500
C       <- 4
TC      <- qkiener2(p = runif(T*C), m = 0, g = 1, a = a, w = w)
matTC   <- matrix(TC, nrow = T, ncol = C, dimnames = list(1:T, letters[1:C]))
head(matTC)
plot.ts(matTC, main = mainTC)
#
matsum  <- apply(matTC, MARGIN=2, cumsum) 
head(matsum)
plot.ts(matsum, plot.type = "single", main = mainsum)
### End example 2


### Example 3 (four plots: probability, density, logit, logdensity)
x     <- q  <- seq(-15, 15, length.out=101)
w     <- c(0.6, 1, 1.5, 2, 3.2, 10) ; names(w) <- w
olty  <- c(2, 1, 2, 1, 2, 1, 1)
olwd  <- c(1, 1, 2, 2, 3, 3, 2)
ocol  <- c(2, 2, 4, 4, 3, 3, 1)
lleg  <- c("logit(0.999) = 6.9", "logit(0.99)   = 4.6", "logit(0.95)   = 2.9", 
           "logit(0.50)   = 0", "logit(0.05)   = -2.9", "logit(0.01)   = -4.6", 
           "logit(0.001) = -6.9  ")
op    <- par(mfrow=c(2,2), mgp=c(1.5,0.8,0), mar=c(3,3,2,1))

plot(x, plogis(x, scale = 2), type = "n", lwd = 2, ylim = c(0, 1),
     xaxs = "i", yaxs = "i", xlab = "", ylab = "", 
     main = "pkiener2(q, m, g, a=2, w=...)")
for (i in 1:length(w)) lines(x, pkiener2(x, a = 2, w = w[i]), 
       lty = olty[i], lwd = olwd[i], col = ocol[i] )
legend("topleft", title = expression(omega), legend = c(w), 
       cex = 0.7, inset = 0.02, lty = olty, lwd = olwd, col = ocol )

plot(x, dlogis(x, scale = 2), type = "n", lwd = 2, ylim = c(0, 0.17),
     xaxs = "i", yaxs = "i", xlab = "", ylab = "", 
     main = "dkiener2(q, m, g, a=2, w=...)")
for (i in 1:length(w)) lines(x, dkiener2(x, a = 2, w = w[i]), 
       lty = olty[i], lwd = olwd[i], col = ocol[i] )
legend("topright", title = expression(omega), legend = c(w), 
       cex = 0.7, inset = 0.02, lty = olty, lwd = olwd, col = ocol )

plot(x, x/2, type = "n", lwd = 1, ylim = c(-7.5, 7.5), yaxt="n", xaxs = "i", 
     yaxs = "i", xlab = "", ylab = "", 
     main = "logit(pkiener2(q, m, g, a=2, w=...))")
axis(2, las=1, at=c(-6.9, -4.6, -2.9, 0, 2.9, 4.6, 6.9) )
for (i in 1:length(w)) lines(x, lkiener2(x, a = 2, w = w[i]),  
       lty = olty[i], lwd = olwd[i], col = ocol[i] )
legend("topleft", legend = lleg, cex = 0.7, inset = 0.02 )
legend("bottomright", title = expression(omega), legend = c(w), 
       cex = 0.7, inset = 0.02, lty = c(olty), lwd = c(olwd), col = c(ocol) )

plot(x, dlogis(x, scale = 2, log=TRUE), type = "n", lwd = 2, ylim = c(-8, -1.5),
     xaxs = "i", yaxs = "i", xlab = "", ylab = "", 
     main = "log(dkiener2(q, m, g, a=2, w=...))")
for (i in 1:length(w)) lines(x, dkiener2(x, a = 2, w = w[i], log=TRUE), 
       lty = olty[i], lwd = olwd[i], col = ocol[i] )
legend("bottom", title = expression(omega), legend = c(w), 
       cex = 0.7, inset = 0.02, lty = olty, lwd = olwd, col = ocol )
### End example 3


### Example 4 (four plots: quantile, derivate, density and quantiles from p)
p     <- ppoints(199, a=0)
w     <- c(0.6, 1, 1.5, 2, 3.2, 10) ; names(w) <- w ; w
op    <- par(mfrow=c(2,2), mgp=c(1.5,0.8,0), mar=c(3,3,2,1))

plot(p, qlogis(p, scale = 2), type = "l", lwd = 2, xlim = c(0, 1), 
     ylim = c(-15, 15), xaxs = "i", yaxs = "i", xlab = "", ylab = "", 
     main = "qkiener2(p, m, g, a=2, w=...)")
for (i in 1:length(w)) lines(p, qkiener2(p, a = 2, w = w[i]), 
          lty = olty[i], lwd = olwd[i], col = ocol[i] )
legend("topleft", title = expression(omega), legend = c(w, "qlogis(x/2)"), 
          inset = 0.02, lty = olty, lwd = olwd, col = ocol, cex = 0.7 )

plot(p, 2/p/(1-p), type = "l", lwd = 2, xlim = c(0, 1), ylim = c(0, 100),
     xaxs = "i", yaxs = "i", xlab = "", ylab = "", 
     main = "dqkiener2(p, m, g, a=2, w=...)")
for (i in 1:length(w)) lines(p, dqkiener2(p, a = 2, w = w[i]), 
          lty = olty[i], lwd = olwd[i], col = ocol[i] )
legend("top", title = expression(omega), legend = c(w, "p*(1-p)/2"), 
          inset = 0.02, lty = olty, lwd = olwd, col = ocol, cex = 0.7 )

plot(qlogis(p, scale = 2), p*(1-p)/2, type = "l", lwd = 2, xlim = c(-15, 15), 
     ylim = c(0, 0.18), xaxs = "i", yaxs = "i", xlab = "", ylab = "", 
     main = "qkiener2, dpkiener2(p, m, g, a=2, w=...)")
for (i in 1:length(w)) { 
     lines(qkiener2(p, a = 2, w = w[i]), dpkiener2(p, a = 2, w = w[i]),
           lty = olty[i], lwd = olwd[i], col = ocol[i] ) }
legend("topleft", title = expression(omega), legend = c(w, "p*(1-p)/2"), 
          inset = 0.02, lty = olty, lwd = olwd, col = ocol, cex = 0.7 )

plot(qlogis(p, scale = 2), p, type = "l", lwd = 2, xlim = c(-15, 15), 
     ylim = c(0, 1), xaxs = "i", yaxs = "i", xlab = "", ylab = "", 
     main = "inverse axis qkiener2(p, m, g, a=2, w=...)")
for (i in 1:length(w)) lines(qkiener2(p, a = 2, w = w[i]), p,
          lty = olty[i], lwd = olwd[i], col = ocol[i] )
legend("topleft", title = expression(omega), legend = c(w, "qlogis(x/2)"), 
          inset = 0.02, lty = olty, lwd = olwd, col = ocol, cex = 0.7 )
### End example 4


### Example 5 (q and VaR, ltm, rtm, and ES)
pp <- c(0.001, 0.0025, 0.005, 0.01, 0.025, 0.05, 
        0.10, 0.20, 0.35, 0.5, 0.65, 0.80, 0.90,
        0.95, 0.975, 0.99, 0.995, 0.9975, 0.999)
m <- -10 ; g <- 1 ; a <- 5 ; w = 3 
k <- aw2k(a, w) ; d <- aw2d(a, w) ; e <- aw2e(a, w)
round(c(m = m, g = g, a = a, k = k, w = w, d = d, e = e), 2) 
plot(qkiener2(pp, m, g, a, w), pp, type = "b")
round(cbind(p = pp, "1-p" = 1-pp,
	q   =   qkiener2(pp, m, g, a, w), 
	ltm = ltmkiener2(pp, m, g, a, w), 
	rtm = rtmkiener2(pp, m, g, a, w), 
	ES  =  eskiener2(pp, m, g, a, w), 
	VaR = varkiener2(pp, m, g, a, w)), 4)
round(kmean(c(m, g, a, w), model = "K2"), 4) # limit value for ltm and rtm
round(cbind(p = pp, "1-p" = 1-pp, 
	q   =   qkiener2(pp, m, g, a, w, lower.tail = FALSE), 
	ltm = ltmkiener2(pp, m, g, a, w, lower.tail = FALSE), 
	rtm = rtmkiener2(pp, m, g, a, w, lower.tail = FALSE), 
	ES  =  eskiener2(pp, m, g, a, w, lower.tail = FALSE), 
	VaR = varkiener2(pp, m, g, a, w, lower.tail = FALSE)), 4)
### End example 5





