library(freqdom.fda)


### Name: fts.dpca
### Title: Compute Functional Dynamic Principal Components and dynamic
###   Karhunen Loeve extepansion
### Aliases: fts.dpca
### Keywords: DPCA

### ** Examples

# Load example PM10 data from Graz, Austria
data(pm10) # loads functional time series pm10 to the environment
X = center.fd(pm10)

# Compute functional dynamic principal components with only one component
res.dpca = fts.dpca(X, Ndpc = 1, freq=(-25:25/25)*pi) # leave default freq for higher precision
plot(res.dpca$Xhat)
fts.plot.filters(res.dpca$filters)

# Compute functional PCA with only one component
res.pca = prcomp(t(X$coefs), center = TRUE)
res.pca$x[,-1] = 0

# Compute empirical variance explained
var.dpca = (1 - sum( (res.dpca$Xhat$coefs - X$coefs)**2 ) / sum(X$coefs**2))*100
var.pca = (1 - sum( (res.pca$x %*% t(res.pca$rotation) - t(X$coefs) )**2 ) / sum(X$coefs**2))*100

cat("Variance explained by PCA (empirical):\t\t",var.pca,"%\n")
cat("Variance explained by PCA (theoretical):\t",
   (1 - (res.pca$sdev[1] / sum(res.pca$sdev)))*100,"%\n")
cat("Variance explained by DPCA (empirical):\t\t",var.dpca,"%\n")
cat("Variance explained by DPCA (theoretical):\t",(res.dpca$var[1])*100,"%\n")

# Plot filters
fts.plot.filters(res.dpca$filters)

# Plot spectral density (note that in case of these data it's concentrated around 0)
fts.plot.operators(res.dpca$spec.density,freq = c(-2,-3:3/30 * pi,2))

# Plot covariance of X
fts.plot.covariance(X)

# Compare values of the first PC scores with the first DPC scores 
plot(res.pca$x[,1],t='l',xlab = "Time",ylab="Score", lwd = 2.5)
lines(res.dpca$scores[,1], col=2, lwd = 2.5)
legend(0,4,c("first PC score","first DPC score"), # puts text in the legend
       lty=c(1,1),lwd=c(2.5,2.5), col=1:2)



