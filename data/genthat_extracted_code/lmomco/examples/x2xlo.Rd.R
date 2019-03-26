library(lmomco)


### Name: x2xlo
### Title: Conversion of a Vector through a Left-Hand Threshold to Setup
###   Conditional Probability Computations
### Aliases: x2xlo
### Keywords: utility (probability) conditional probability probability
###   (conditional)

### ** Examples

## Not run: 
##D set.seed(62)
##D Fs <- nonexceeds()
##D type <- "exp"; parent <- vec2par(c(0,13.4), type=type)
##D X <- rlmomco(100, parent); a <- 0; PP <- pp(X, a=a); Xs <- sort(X)
##D par <- lmom2par(lmoms(X), type=type)
##D plot(PP, Xs, type="n", xlim=c(0,1), ylim=c(.1,100), log="y",
##D      xlab="NONEXCEEDANCE PROBABILITY", ylab="RANDOM VARIATE")
##D points(PP, Xs, col=3, cex=2, pch=0, lwd=2)
##D X[X < 2.1] <- X[X < 2.1]/2 # create some low outliers
##D Xlo <- x2xlo(X, leftout=2.1, a=a)
##D parlo <- lmom2par(lmoms(Xlo$xin), type=type)
##D points(Xlo$ppout, Xlo$xout, pch=4, col=1)
##D points(Xlo$ppin, Xlo$xin,   col=4, cex=.7)
##D lines(Fs, qlmomco(Fs, parent), lty=2, lwd=2)
##D lines(Fs, qlmomco(Fs, par),    col=2, lwd=4)
##D lines(sort(c(Xlo$ppin,.999)),
##D       qlmomco(f2flo(sort(c(Xlo$ppin,.999)), pp=Xlo$pp), parlo), col=4, lwd=3)
##D # Notice how in the last line plotted that the proper plotting positions of the data
##D # greater than the threshold are passed into the f2flo() function that has the effect
##D # of mapping conventional nonexceedance probabilities into the conditional probability
##D # space. These mapped probabilities are then passed into the quantile function.
##D legend(.3,1, c("Simulated random variates",
##D                 "Values to 'leave' (condition) out because x/2 (low outliers)",
##D                 "Values to 'leave' in", "Exponential parent",
##D                 "Exponential fitted to whole data set",
##D                 "Exponential fitted to left-in values"), bty="n", cex=.75,
##D                 pch   =c(0,4,1,NA,NA,NA), col=c(3,1,4,1,2,4), pt.lwd=c(2,1,1,1),
##D                 pt.cex=c(2,1,0.7,1),      lwd=c(0,0,0,2,2,3),    lty=c(0,0,0,2,1,1))
## End(Not run)



