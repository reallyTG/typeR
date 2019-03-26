library(multiAssetOptions)


### Name: plotOptionValues
### Title: Plot Option Values Over Time
### Aliases: plotOptionValues

### ** Examples

# plot test

# initialize inputs list
X <- list()

# option inputs
X$opt$nAsset <- 2
X$opt$payType <- 0
X$opt$exerType <- 0
X$opt$pcFlag <- c(0, 0)
X$opt$ttm <- 0.5
X$opt$strike <- c(110, 90)
X$opt$rf <- 0.10
X$opt$q <- c(0.05, 0.04)
X$opt$vol <- c(0.20, 0.25)
X$opt$rho <- matrix(c(1, -0.5, -0.5, 1), X$opt$nAsset, X$opt$nAsset)

# finite difference inputs
X$fd$m <- c(10, 10)
X$fd$leftBound <- c(0, 0)
X$fd$kMult <- c(0, 0)
X$fd$density <- c(5, 5)
X$fd$kShift <- c(1, 1)
X$fd$theta <- 0.5
X$fd$maxSmooth <- 2
X$fd$tol <- 1e-7
X$fd$maxIter <- 3

# timestep inputs
X$time$tsType <- 0
X$time$N <- min(X$fd$m) * 4
X$time$dtInit <- 0.1 / 4^log2(min(X$fd$m)/5)
X$time$dNorm <- 5 / 2^log2(min(X$fd$m)/5)
X$time$D <- 0.05

Y <- multiAssetOption(X)

# function check
plotOptionValues(Y, 40)



