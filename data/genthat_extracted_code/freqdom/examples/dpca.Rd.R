library(freqdom)


### Name: dpca
### Title: Compute Dynamic Principal Components and dynamic Karhunen Loeve
###   extepansion
### Aliases: dpca
### Keywords: DPCA

### ** Examples

X = rar(100,3)

# Compute DPCA with only one component
res.dpca = dpca(X, q = 5, Ndpc = 1)

# Compute PCA with only one component
res.pca = prcomp(X, center = TRUE)
res.pca$x[,-1] = 0

# Reconstruct the data
var.dpca = (1 - sum( (res.dpca$Xhat - X)**2 ) / sum(X**2))*100
var.pca = (1 - sum( (res.pca$x %*% t(res.pca$rotation) - X)**2 ) / sum(X**2))*100

cat("Variance explained by DPCA:\t",var.dpca,"%\n")
cat("Variance explained by PCA:\t",var.pca,"%\n")



