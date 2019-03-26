library(FatTailsR)


### Name: logishp
### Title: The Power Hyperbola Logistic Distribution
### Aliases: logishp dlogishp plogishp invkogit qlogishp kogit rlogishp
###   dplogishp dqlogishp llogishp dllogishp qllogishp

### ** Examples


require(graphics)

### Example 1
pp <- c(ppoints(11, a = 1), NA, NaN) ; pp
plogishp(-5:5, k = 4)
dlogishp(-5:5, k = 4)
qlogishp(pp, k = 4)
outer(-5:5, 1:6, plogishp)
outer(-5:5, 1:6, dlogishp)
outer(runif(20), 1:6, qlogishp)

### Example 2
x     <- seq(-15, 15, length.out = 101)
k     <- c(0.6, 1, 1.5, 2, 3.2, 10) ; names(k) <- k ; k
olty  <- c(2, 1, 2, 1, 2, 1, 1)
olwd  <- c(1, 1, 2, 2, 3, 4, 2)
ocol  <- c(2, 2, 4, 4, 3, 3, 1)
op    <- par(mfrow = c(2,2), mgp = c(1.5,0.8,0), mar = c(3,3,2,1))

plot(x, plogis(x, scale = 2), type = "b", lwd = 2, ylim = c(0, 1),
     xaxs = "i", yaxs = "i", xlab = "", ylab = "", main = "plogishp(x, k)")
for (i in 1:length(k)) lines(x, plogishp(x, k = k[i]), 
          lty = olty[i], lwd = olwd[i], col = ocol[i] )
legend("topleft", title = expression(kappa), legend = c(k, "plogis(x/2)"), 
          inset = 0.02, lty = olty, lwd = olwd, col = ocol, cex = 0.7 )

plot(x, dlogis(x, scale = 2), type = "b", lwd = 2, xaxs = "i", 
     yaxs = "i", xlab = "", ylab = "", main = "dlogishp(x, k)")
for (i in 1:length(k)) lines(x, dlogishp(x, k = k[i]), 
          lty = olty[i], lwd = olwd[i], col = ocol[i] )

plot(x, x/2, type = "b", lwd = 2, ylim = c(-7.5, 7.5), xaxs = "i", 
     yaxs = "i", xlab = "", ylab = "", main = "logit(logishp(h, k))")
for (i in 1:length(k)) lines(x, llogishp(x, k = k[i]),  
          lty = olty[i], lwd = olwd[i], col = ocol[i] )

plot(x, log(dlogis(x, scale = 2)), lwd = 2, type = "b", xaxs = "i", 
     yaxs = "i", xlab = "", ylab = "", main = "log(dlogishp(x, k))") 
for (i in 1:length(k)) lines(x, dlogishp(x, k = k[i], log = TRUE),  
          lty = olty[i], lwd = olwd[i], col = ocol[i] )
### End example 2

### Example 3
p <- ppoints(199, a=0)
plot(p, qlogis(p, scale = 2), type = "o", lwd = 2, ylim = c(-15, 15),
     xaxs = "i", yaxs = "i", xlab = "", ylab = "", 
     main = "qlogishp(p, k)")
for (i in 1:length(k)) lines(p, qlogishp(p, k = k[i]), 
          lty = olty[i], lwd = olwd[i], col = ocol[i] )
legend("topleft", title = expression(kappa), legend = c(k, "qlogis(x/2)"), 
          inset = 0.02, lty = olty, lwd = olwd, col = ocol, cex = 0.7 )

plot(p, 2/p/(1-p), type = "o", lwd = 2, xlim = c(0, 1), ylim = c(0, 100),
     xaxs = "i", yaxs = "i", xlab = "", ylab = "", 
     main = "dqlogishp(p, k)")
for (i in 1:length(k)) lines(p, dqlogishp(p, k = k[i]), 
          lty = olty[i], lwd = olwd[i], col = ocol[i] )
legend("top", title = expression(kappa), legend = c(k, "p*(1-p)/2"), 
          inset = 0.02, lty = olty, lwd = olwd, col = ocol, cex = 0.7 )

plot(qlogis(p, scale = 2), p*(1-p)/2, type = "o", lwd = 2, xlim = c(-15, 15), 
     ylim = c(0, 0.14), xaxs = "i", yaxs = "i", xlab = "", ylab = "", 
     main = "qlogishp, dplogishp(p, k)")
for (i in 1:length(k)) lines(qlogishp(p, k = k[i]), dplogishp(p, k = k[i]),
          lty = olty[i], lwd = olwd[i], col = ocol[i] )
legend("topleft", title = expression(kappa), legend = c(k, "p*(1-p)/2"), 
          inset = 0.02, lty = olty, lwd = olwd, col = ocol, cex = 0.7 )
### End example 3




