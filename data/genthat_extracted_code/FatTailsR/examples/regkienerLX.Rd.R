library(FatTailsR)


### Name: regkienerLX
### Title: Regression Function for Kiener Distributions
### Aliases: regkienerLX

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

## Plotting
lleg   <- c("logit(0.999) = 6.9", "logit(0.99)   = 4.6", 
           "logit(0.95)   = 2.9", "logit(0.50)   = 0", 
           "logit(0.05)   = -2.9", "logit(0.01)   = -4.6", 
           "logit(0.001) = -6.9  ")
pleg   <- c( paste("m =",  reg$coefr4[1]), paste("g  =", reg$coefr4[2]), 
             paste("k  =", reg$coefr4[3]), paste("e  =", reg$coefr4[4]) )
op     <- par(mfrow=c(2,2), mgp=c(1.5,0.8,0), mar=c(3,3,2,1))
plot(X, type="l", main = nameX)
plot(reg$dfrXL, main = nameX, yaxt = "n")
axis(2, las=1, at=c(-9.2, -6.9, -4.6, -2.9, 0, 2.9, 4.6, 6.9, 9.2))
abline(h = c(-4.6, 4.6), lty = 4)
abline(v = c(reg$quantk[5], reg$quantk[9]), lty = 4)
legend("topleft", legend = lleg, cex = 0.7, inset = 0.02, bg = "#FFFFFF")
lines(reg$dfrEL, col = 2, lwd = 2)
points(reg$dfrQkLk, pch = 3, col = 2, lwd = 2, cex = 1.5)
plot(reg$dfrXP, main = nameX)
legend("topleft", legend = pleg, cex = 0.9, inset = 0.02 )
lines(reg$dfrEP, col = 2, lwd = 2)
plot(density(X), main = nameX)
lines(reg$dfrED, col = 2, lwd = 2)
round(cbind("k" = kmoments(reg$coefk, lengthx = nrow(reg$dfrXL)), "X" = xmoments(X)), 2)

## Attributes
attributes(reg)
head(reg$dfrXP)
head(reg$dfrXL)
head(reg$dfrXR)
head(reg$dfrEP)
head(reg$dfrEL)
head(reg$dfrED)
reg$regk0
reg$coefk0
reg$vcovk0
reg$vcovk0m
reg$mcork0
reg$coefk
reg$coefk1
reg$coefk2
reg$coefk3
reg$coefk4
reg$quantk
reg$coefr
reg$coefr1
reg$coefr2
reg$coefr3
reg$coefr4
reg$quantr
reg$dfrQkPk
reg$dfrQkLk
reg$dfrESkPk
reg$dfrESkLk
reg$fitk

## subset fitk
names(reg$fitk)
reg$fitk[exfit6]
reg$fitk[c(exfit1, exfit4)]
### End block




