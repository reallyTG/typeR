library(ICSOutlier)


### Name: plot.icsOut
### Title: Distances Plot for an icsOut Object
### Aliases: plot-icsOut plot.icsOut plot-method plot,icsOut,missing-method
### Keywords: hplot methods

### ** Examples

    Z <- rmvnorm(1000, rep(0, 6))
    Z[1:20, 1] <- Z[1:20, 1] + 10
    A <- matrix(rnorm(36), ncol = 6)
    X <- tcrossprod(Z, A)
    icsX <- ics2(X)
    # For demonstation purposes mDist is small, should be larger for real data analysis
    icsXoutliers <- ics.outlier(icsX, mDist = 500)
    plot(icsXoutliers, col.out = 2)



