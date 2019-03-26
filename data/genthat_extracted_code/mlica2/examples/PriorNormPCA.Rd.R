library(mlica2)


### Name: PriorNormPCA
### Title: Prior PCA analysis for threshold setting and noise removal
### Aliases: PriorNormPCA

### ** Examples


## The function is currently defined as
function (X) 
{
    ndim <- ncol(X)
    ntp <- nrow(X)
    for (s in 1:ndim) {
        X[, s] <- X[, s] - mean(X[, s])
    }
    print("Performing SVD")
    svd.o <- svd(X, LINPACK = TRUE)
    Dx <- diag(svd.o$d * svd.o$d)/ntp
    Ex <- svd.o$v
    barplot(Dx, main = "Singular values")
    return(list(X = X, Dx = Dx, Ex = Ex))
  }



