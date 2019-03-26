#install(".")
library("freqdom")
library("freqdom.fda")
data(pm10)
pm10 = center.fd(pm10)
X = center.fd(pm10)
q = 20

# res.dpca = list()
# res.dpca$spec.density = fts.spectral.density(X, q = q)
# res.dpca$filters = fts.dpca.filters(res.dpca$spec.density, q = q, Ndpc = 5)
# res.dpca$scores = fts.dpca.scores(X, res.dpca$filters)
# res.dpca$var = fts.dpca.var(res.dpca$spec.density)
# res.dpca$Xhat = fts.dpca.KLexpansion(X, res.dpca$filters)

res.dpca = fts.dpca(X, Ndpc = 1)
plot(res.dpca$Xhat)
fts.plot.filters(res.dpca$filters)

# Compute PCA with only one component
res.pca = prcomp(t(X$coefs), center = TRUE)
res.pca$x[,-1] = 0

# Compute empirical variance explained
var.pca = (1 - sum( (res.pca$x %*% t(res.pca$rotation) - t(X$coefs) )**2 ) / sum(X$coefs**2))*100
var.dpca = (1 - sum( (res.dpca$Xhat$coefs - X$coefs)**2 ) / sum(X$coefs**2))*100

cat("Variance explained by PCA (empirical):\t\t",var.pca,"%\n")
cat("Variance explained by PCA (theoretical):\t",(1 - (res.pca$sdev[1] / sum(res.pca$sdev)))*100,"%\n")
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