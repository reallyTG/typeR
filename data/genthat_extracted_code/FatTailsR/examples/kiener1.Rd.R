library(FatTailsR)


### Name: kiener1
### Title: Symmetric Kiener Distribution K1
### Aliases: kiener1 dkiener1 pkiener1 qkiener1 rkiener1 dpkiener1
###   dqkiener1 lkiener1 dlkiener1 qlkiener1 varkiener1 ltmkiener1
###   rtmkiener1 dtmqkiener1 eskiener1

### ** Examples


require(graphics)

### Example 1
pp <- c(ppoints(11, a = 1), NA, NaN) ; pp
qkiener1(p = pp, k = 4)


### Example 2: Try various value of k = 1.5, 3, 5, 10
k       <- 5  # 1.5, 3, 5, 10
set.seed(2014)
mainTC  <- paste("qkiener1(p, m = 0, g = 1, k = ", k, ")")
mainsum <- paste("cumulated qkiener1(p, m = 0, g = 1, k = ", k, ")")
T       <- 500
C       <- 4
TC      <- qkiener1(p = runif(T*C), m = 0, g = 1, k = k)
matTC   <- matrix(TC, nrow = T, ncol = C, dimnames = list(1:T, letters[1:C]))
head(matTC)
plot.ts(matTC, main = mainTC)
#
matsum  <- apply(matTC, MARGIN=2, cumsum) 
head(matsum)
plot.ts(matsum, plot.type = "single", main = mainsum)
### End example 2


### Example 3 (four plots: probability, density, logit, logdensity)
x  <- q  <- seq(-15, 15, length.out=101)
k     <- c(0.6, 1, 1.5, 2, 3.2, 10) ; names(k) <- k ; k
olty  <- c(2, 1, 2, 1, 2, 1, 1)
olwd  <- c(1, 1, 2, 2, 3, 3, 2)
ocol  <- c(2, 2, 4, 4, 3, 3, 1)
lleg  <- c("logit(0.999) = 6.9", "logit(0.99)   = 4.6", "logit(0.95)   = 2.9", 
           "logit(0.50)   = 0", "logit(0.05)   = -2.9", "logit(0.01)   = -4.6", 
           "logit(0.001) = -6.9  ")
op    <- par(mfrow=c(2,2), mgp=c(1.5,0.8,0), mar=c(3,3,2,1))

plot(x, plogis(x, scale = 2), type = "b", lwd = 2, ylim = c(0, 1),
     xaxs = "i", yaxs = "i", xlab = "", ylab = "", 
     main = "pkiener1(q, m, g, k)")
for (i in 1:length(k)) lines(x, pkiener1(x, k = k[i]), 
       lty = olty[i], lwd = olwd[i], col = ocol[i] )
legend("topleft", title = expression(kappa), legend = c(k, "logistic"), 
       cex = 0.7, inset = 0.02, lty = olty, lwd = olwd, col = ocol )

plot(x, dlogis(x, scale = 2), type = "b", lwd = 2, ylim = c(0, 0.14), 
     xaxs = "i", yaxs = "i", xlab = "", ylab = "", main = "dkiener1(x, m, g, k)" )
for (i in 1:length(k)) lines(x, dkiener1(x, k = k[i]), 
       lty = olty[i], lwd = olwd[i], col = ocol[i] )
legend("topright", title = expression(kappa), legend = c(k, "logistic"), 
       cex = 0.7, inset = 0.02, lty = olty, lwd = olwd, col = ocol )

plot(x, x/2, type = "b", lwd = 2, ylim = c(-7.5, 7.5), yaxt="n", xaxs = "i", 
     yaxs = "i", xlab = "", ylab = "", main = "logit(pkiener1(q, m, g, k))")
axis(2, las=1, at=c(-6.9, -4.6, -2.9, 0, 2.9, 4.6, 6.9) )
for (i in 1:length(k)) lines(x, lkiener1(x, k = k[i]),  
       lty = olty[i], lwd = olwd[i], col = ocol[i] )
lines(x, logit(pnorm(x, 0, 3.192)), type="l", lty=1, lwd=3, col=7) # erfx
legend("topleft", legend = lleg, cex = 0.7, inset = 0.02 )
legend("bottomright", title = expression(kappa), 
       legend = c(k, "logistic", "Gauss"), cex = 0.7, inset = 0.02, 
       lty = c(olty, 1), lwd = c(olwd, 3), col = c(ocol , 7) )

plot(x, log(dlogis(x, scale = 2)), lwd = 2, type = "b", ylim = c(-8, -1.5), 
     xaxs = "i", yaxs = "i", xlab = "", ylab = "", main = "log(dkiener1(x, m, g, k))") 
for (i in 1:length(k)) lines(x, log(dkiener1(x, k = k[i])),  
       lty = olty[i], lwd = olwd[i], col = ocol[i] )
lines(x, dnorm(x, 0, 3.192, log = TRUE), type = "l", lty = 1, lwd = 3, col = 7)
legend("bottom", title = expression(kappa), legend = c(k, "logistic", "Gauss"), 
       cex = 0.7, inset = 0.02, lty = c(olty, 1), lwd = c(olwd, 3), col = c(ocol , 7) )
### End example 3


### Example 4 (four plots: quantile, derivate, density and quantiles from p)
p   <- ppoints(199, a=0)
k   <- c(0.6, 1, 1.5, 2, 3.2, 10) ; names(k) <- k ; k
op  <- par(mfrow=c(2,2), mgp=c(1.5,0.8,0), mar=c(3,3,2,1))
plot(p, qlogis(p, scale = 2), type = "o", lwd = 2, ylim = c(-15, 15),
     xaxs = "i", yaxs = "i", xlab = "", ylab = "", 
     main = "qkiener1(p, m, g, k)")
for (i in 1:length(k)) lines(p, qkiener1(p, k = k[i]), 
          lty = olty[i], lwd = olwd[i], col = ocol[i] )
legend("topleft", title = expression(kappa), legend = c(k, "qlogis(x/2)"), 
          inset = 0.02, lty = olty, lwd = olwd, col = ocol, cex = 0.7 )

plot(p, 2/p/(1-p), type = "o", lwd = 2, xlim = c(0, 1), ylim = c(0, 100),
     xaxs = "i", yaxs = "i", xlab = "", ylab = "", 
     main = "dqkiener1(p, m, g, k)")
for (i in 1:length(k)) lines(p, dqkiener1(p, k = k[i]), 
          lty = olty[i], lwd = olwd[i], col = ocol[i] )
legend("top", title = expression(kappa), legend = c(k, "p*(1-p)/2"), 
          inset = 0.02, lty = olty, lwd = olwd, col = ocol, cex = 0.7 )

plot(qlogis(p, scale = 2), p*(1-p)/2, type = "o", lwd = 2, xlim = c(-15, 15), 
     ylim = c(0, 0.14), xaxs = "i", yaxs = "i", xlab = "", ylab = "", 
     main = "qkiener1, dpkiener1(p, m, g, k)")
for (i in 1:length(k)) lines(qkiener1(p, k = k[i]), dpkiener1(p, k = k[i]),
          lty = olty[i], lwd = olwd[i], col = ocol[i] )
legend("topleft", title = expression(kappa), legend = c(k, "p*(1-p)/2"), 
          inset = 0.02, lty = olty, lwd = olwd, col = ocol, cex = 0.7 )
### End example 4


### Example 5 (q and VaR, ltm, rtm, and ES)
pp <- c(0.001, 0.0025, 0.005, 0.01, 0.025, 0.05, 
        0.10, 0.20, 0.35, 0.5, 0.65, 0.80, 0.90,
        0.95, 0.975, 0.99, 0.995, 0.9975, 0.999)
m <- -10 ; g <- 1 ; k <- 4
round(c(m = m, g = g, a = k, k = k, w = k, d = 0, e = 0), 2) 
plot(qkiener1(pp, m, g, k), pp, type = "b")
round(cbind(p = pp, "1-p" = 1-pp, 
	q   =   qkiener1(pp, m, g, k), 
	ltm = ltmkiener1(pp, m, g, k), 
	rtm = rtmkiener1(pp, m, g, k), 
	es  =  eskiener1(pp, m, g, k), 
	VaR = varkiener1(pp, m, g, k)), 4)
round(kmean(c(m, g, k), model = "K1"), 4) # limit value of ltm, rtm
round(cbind(p = pp, "1-p" = 1-pp, 
	q   =   qkiener1(pp, m, g, k, lower.tail = FALSE), 
	ltm = ltmkiener1(pp, m, g, k, lower.tail = FALSE), 
	rtm = rtmkiener1(pp, m, g, k, lower.tail = FALSE), 
	es  =  eskiener1(pp, m, g, k, lower.tail = FALSE), 
	VaR = varkiener1(pp, m, g, k, lower.tail = FALSE)), 4)
### End example 5





