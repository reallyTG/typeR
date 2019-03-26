library(adespatial)


### Name: variogmultiv
### Title: Function to compute multivariate empirical variogram
### Aliases: variogmultiv
### Keywords: spatial

### ** Examples


if(require(ade4)){
data(oribatid)
# Hellinger transformation
fau <- sqrt(oribatid$fau / outer(apply(oribatid$fau, 1, sum), rep(1, ncol(oribatid$fau)), "*"))
# Removing linear effect
faudt <- resid(lm(as.matrix(fau) ~ as.matrix(oribatid$xy))) 
mvspec <- variogmultiv(faudt, oribatid$xy, nclass = 20)
mvspec
plot(mvspec$d, mvspec$var,type = 'b', pch = 20, xlab = "Distance", ylab = "C(distance)")
}




