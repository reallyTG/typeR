library(FatTailsR)


### Name: FatTailsR-package
### Title: Package FatTailsR
### Aliases: FatTailsR-package FatTailsR
### Keywords: distribution models symbolmath

### ** Examples

    

require(graphics)
require(minpack.lm)
require(timeSeries)

### Load the datasets and select one number (1-16)
DS     <- getDSdata()
j      <- 5

### and run this block
X      <- DS[[j]]
nameX  <- names(DS)[j]
reg    <- regkienerLX(X)
lgn    <- laplacegaussnorm(X)
lleg   <- c("logit(0.999) = 6.9", "logit(0.99)   = 4.6", 
           "logit(0.95)   = 2.9", "logit(0.50)   = 0", 
           "logit(0.05)   = -2.9", "logit(0.01)   = -4.6", 
           "logit(0.001) = -6.9  ")
pleg   <- c( paste("m =",  reg$coefr4[1]), paste("g  =", reg$coefr4[2]), 
             paste("k  =", reg$coefr4[3]), paste("e  =", reg$coefr4[4]) )

## Main plot
op     <- par(mfrow = c(1,1), mgp = c(1.5,0.8,0), mar = c(3,3,2,1))
plot(reg$dfrXP, main = nameX)
legend("top", legend = pleg, cex = 0.9, inset = 0.02 )
lines(reg$dfrEP, col = 2, lwd = 2)
points(reg$dfrQkPk, pch = 3, col = 2, lwd = 2, cex = 1.5)
lines(lgn$dfrXPn, col = 7, lwd = 2)

## Plot F(X) > 0,97
front = c(0.06, 0.39, 0.50, 0.95)
par(fig = front, new = TRUE, mgp = c(1.5, 0.6, 0), las = 0)
plot( reg$dfrXP[which(reg$dfrXP$P > 0.97),] , pch = 1, xlab = "", ylab = "", main = "F(X) > 0,97" )
lines(reg$dfrEP[which(reg$dfrEP$P > 0.97),], type="l", col = 2, lwd = 3 )
lines(lgn$dfrXPn[which(lgn$dfrXPn$Pn > 0.97),], type = "l", col = 7, lwd= 2 )
points(reg$dfrQkPk, pch = 3, col = 2, lwd = 2, cex = 1.5)
points(lgn$dfrQnPn, pch = 3, col = 7, lwd = 2, cex = 1)

## Plot F(X) < 0,03
front = c(0.58, 0.98, 0.06, 0.61)
par(fig = front, new = TRUE, mgp = c(0.5, 0.6, 0), las = 0 )
plot( reg$dfrXP[which(reg$dfrXP$P < 0.03),] , pch = 1, xlab = "", ylab = "", main = "F(X) < 0,03")
lines(reg$dfrEP[which(reg$dfrEP$P < 0.03),], type = "l", col = 2, lwd = 3 )
lines(lgn$dfrXPn[which(lgn$dfrXPn$Pn < 0.03),], type = "l", col= 7, lwd= 2 )
points(reg$dfrQkPk, pch = 3, col = 2, lwd = 2, cex = 1.5)
points(lgn$dfrQnPn, pch = 3, col = 7, lwd = 2, cex = 1)

## Moments from the parameters (k) and from the Dataset (X)
round(cbind("k" = kmoments(reg$coefk, lengthx = nrow(reg$dfrXL)), "X" = xmoments(X)), 2)
attributes(reg)
### End block





