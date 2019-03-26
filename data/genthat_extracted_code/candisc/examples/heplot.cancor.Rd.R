library(candisc)


### Name: heplot.cancor
### Title: Canonical Correlation HE plots
### Aliases: heplot.cancor heplot3d.cancor
### Keywords: hplot multivariate

### ** Examples

data(Rohwer, package="heplots")
X <- as.matrix(Rohwer[,6:10])
Y <- as.matrix(Rohwer[,3:5])
cc <- cancor(X, Y, set.names=c("PA", "Ability"))

# basic plot
heplot(cc)

# note relationship of joint hypothesis to individual ones
heplot(cc, scale=1.25, hypotheses=list("na+ns"=c("na", "ns")))

# more options
heplot(cc, hypotheses=list("All X"=colnames(X)),
	fill=c(TRUE,FALSE), fill.alpha=0.2,
	var.cex=1.5, var.col="red", var.lwd=3,
	prefix="Y canonical dimension"
	)

# 3D version
## Not run: 
##D heplot3d(cc, var.lwd=3, var.col="red")
## End(Not run)




