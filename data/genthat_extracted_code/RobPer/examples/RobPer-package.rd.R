library(RobPer)


### Name: RobPer-package
### Title: The RobPer-package
### Aliases: RobPer-package

### ** Examples

# Generate a disturbed light curve:
set.seed(22)
lightcurve <- tsgen(ttype="sine",ytype="peak" , pf=7, redpart=0.1, s.outlier.fraction=0.1,
    interval=TRUE, npoints=200, ncycles=25, ps=20, SNR=3, alpha=0)

# Plotting the light curve (vertical bars show measurement accuracies)
plot(lightcurve[,1], lightcurve[,2], pch=16, cex=0.5, xlab="t", ylab="y", 
    main="a Light Curve")
rect(lightcurve[,1], lightcurve[,2]+lightcurve[,3], lightcurve[,1], 
    lightcurve[,2]-lightcurve[,3])

# The lightcurve has a period of 7:
plot(lightcurve[,1]%%7, lightcurve[,2], pch=16, cex=0.5, xlab="t", ylab="y",
    main="Phase Diagram of a Light Curve")
rect(lightcurve[,1]%%7, lightcurve[,2]+lightcurve[,3], lightcurve[,1]%%7, 
    lightcurve[,2]-lightcurve[,3])

# Calculate a periodogram of a light curve:
PP <- RobPer(lightcurve, model="splines", regression="huber", weighting=FALSE, 
    var1=FALSE, periods=1:50)

# Searching for extremely high periodogram bars:
betavalues <- betaCvMfit(PP)
crit.val <- qbeta((0.95)^(1/50),shape1=betavalues[1], shape2=betavalues[2])

hist(PP, breaks=20, freq=FALSE, ylim=c(0,100), xlim=c(0,0.08), col=8, main ="")
betafun <- function(x) dbeta(x, shape1=betavalues[1], shape2=betavalues[2])
curve(betafun, add=TRUE, lwd=2)
abline(v=crit.val, lwd=2)

# alternatives for fitting beta distributions:
# method of moments:
par.mom <- betaCvMfit(PP, rob=FALSE, CvM=FALSE)
myf.mom <- function(x) dbeta(x, shape1=par.mom[1], shape2=par.mom[2])
curve(myf.mom, add=TRUE, lwd=2, col="red")
crit.mom <- qbeta((0.95)^(1/50),shape1=par.mom[1], shape2=par.mom[2])
abline(v=crit.mom, lwd=2, col="red")

# robust method of moments
par.rob <- betaCvMfit(PP, rob=TRUE, CvM=FALSE)
myf.rob <- function(x) dbeta(x, shape1=par.rob[1], shape2=par.rob[2])
curve(myf.rob, add=TRUE, lwd=2, col="blue")
crit.rob <- qbeta((0.95)^(1/50),shape1=par.rob[1], shape2=par.rob[2])
abline(v=crit.rob, lwd=2, col="blue")

legend("topright", fill=c("black","red","blue"), 
    legend=c("CvM", "moments", "robust moments"), bg="white")
box()

# Detect fluctuation period:
plot(1:50, PP, xlab="Trial Period", ylab="Periodogram", type="l", 
    main="Periodogram fitting periodic splines using M-regression (Huber function)")
abline(h=crit.val, lwd=2)
text(c(7,14), PP[c(7,14)], c(7,14), adj=1, pos=4)
axis(1, at=7, labels=expression(p[f]==7))

# Comparison with non-robust periodogram
# (see package vignette, section 5.1 for further graphical analysis)
PP2 <- RobPer(lightcurve, model="splines", regression="L2",
    weighting=FALSE, var1=FALSE, periods=1:50)
betavalues2 <- betaCvMfit(PP2)
crit.val2   <- qbeta((0.95)^(1/50),shape1=betavalues2[1], shape2=betavalues2[2])

plot(1:50, PP2, xlab="Trial Period", ylab="Periodogram", type="l", 
    main="Periodogram fitting periodic splines using L2-regression")
abline(h=crit.val2, lwd=2)



