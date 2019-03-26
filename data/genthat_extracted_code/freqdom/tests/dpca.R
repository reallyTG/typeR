library("freqdom")
#library("astsa")
#Y = scale(lap)
Y = rar(100,3)

# Compute DPCA with only one component
res.dpca = dpca(Y, q = 5, Ndpc = 1)

# Compute PCA with only one component
res.pca = prcomp(Y,center = TRUE)
res.pca$x[,-1] = 0

# Reconstruct the data
var.dpca = (1 - sum((res.dpca$Xhat - Y)**2) / sum(Y**2))*100
var.pca = (1 - sum( (res.pca$x %*% t(res.pca$rotation) - Y)**2) / sum( (Y)**2))*100

cat("Variance explained by DPCA:\t",var.dpca,"%\n")
cat("Variance explained by PCA:\t",var.pca,"%\n")
