library(genridge)


### Name: precision
### Title: Measures of Precision and Shrinkage for Ridge Regression
### Aliases: precision precision.ridge precision.lm
### Keywords: regression models

### ** Examples

longley.y <- longley[, "Employed"]
longley.X <- data.matrix(longley[, c(2:6,1)])

lambda <- c(0, 0.005, 0.01, 0.02, 0.04, 0.08)
lridge <- ridge(longley.y, longley.X, lambda=lambda)
clr <- c("black", rainbow(length(lambda)-1, start=.6, end=.1))
coef(lridge)

(pdat <- precision(lridge))
# plot log |Var(b)| vs. length(beta)
with(pdat, {
	plot(norm.beta, det, type="b", 
	cex.lab=1.25, pch=16, cex=1.5, col=clr, lwd=2,
	xlab='shrinkage: ||b|| / max(||b||)',
	ylab='variance: log |Var(b)|')
	text(norm.beta, det, lambda, cex=1.25, pos=c(rep(2,length(lambda)-1),4))
	text(min(norm.beta), max(det), "Variance vs. Shrinkage", cex=1.5, pos=4)
	})

# plot trace[Var(b)] vs. length(beta)
with(pdat, {
	plot(norm.beta, trace, type="b",
	cex.lab=1.25, pch=16, cex=1.5, col=clr, lwd=2,
	xlab='shrinkage: ||b|| / max(||b||)',
	ylab='variance: trace [Var(b)]')
	text(norm.beta, trace, lambda, cex=1.25, pos=c(2, rep(4,length(lambda)-1)))
#	text(min(norm.beta), max(det), "Variance vs. Shrinkage", cex=1.5, pos=4)
	})




