library(copula)


### Name: rlog
### Title: Sampling Logarithmic Distributions
### Aliases: rlog rlogR
### Keywords: distribution

### ** Examples

## Sample n random variates from a Log(p) distribution and plot a
## "histogram"
n <- 1000
p <- .5
X <- rlog(n, p)
table(X) ## distribution on the integers {1, 2, ..}
## ==> The following plot is more reasonable than a  hist(X, prob=TRUE) :
plot(table(X)/n, type="h", lwd=10, col="gray70")

## case closer to numerical boundary:
lV <- log10(V <- rlog(10000, Ip = 2e-9))# Ip = exp(-theta) <==> theta ~= 20
hV <- hist(lV, plot=FALSE)
dV <- density(lV)
## Plot density and histogram on log scale with nice axis labeling & ticks:
plot(dV, xaxt="n", ylim = c(0, max(hV$density, dV$y)),
     main = "Density of [log-transformed] Log(p),  p=0.999999..")
abline(h=0, lty=3); rug(lV); lines(hV, freq=FALSE, col = "light blue"); lines(dV)
rx <- range(pretty(par("usr")[1:2]))
sx <- outer(1:9, 10^(max(0,rx[1]):rx[2]))
axis(1, at=log10(sx),     labels= FALSE, tcl = -0.3)
axis(1, at=log10(sx[1,]), labels= formatC(sx[1,]), tcl = -0.75)



