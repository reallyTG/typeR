library(xoi)


### Name: fitGamma
### Title: Fit Gamma model
### Aliases: fitGamma
### Keywords: models

### ** Examples


data(bssbsb)
## Don't show: 
bssbsb <- bssbsb[,1:50]
## End(Don't show)

xodist <- convertxoloc(find.breaks(bssbsb, chr=1))

# plot a rough log likelihood curve
## Not run: out <- fitGamma(xodist, nu=seq(1, 19, by=2))
## Don't show: 
out <- fitGamma(xodist, nu=seq(1, 19, by=2), tol=0.001)
## End(Don't show)
plot(out, type="l", lwd=2)

# get MLE
## Not run: mle <- fitGamma(xodist, lo=8, hi=12)
## Don't show: 
mle <- fitGamma(xodist, lo=8, hi=12, tol=0.001)
## End(Don't show)
mle

abline(v=mle[1], h=mle[2], col="blue", lty=2)

# get MLE and SE
## Not run: mle <- fitGamma(xodist, lo=9.5, hi=10.5, se=TRUE)
## Don't show: 
mle <- fitGamma(xodist, lo=9.5, hi=10.5, se=TRUE, tol=0.001)
## End(Don't show)
mle

# get MLE and 10^1.5 support interval
## Not run: int <- fitGamma(xodist, lo=1, hi=20, supint=TRUE)
## Don't show: 
int <- fitGamma(xodist, lo=1, hi=20, supint=TRUE, tol=0.001)
## End(Don't show)
int
abline(v=mle[2:3,1], h=mle[2:3,2], col="red", lty=2)




