## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(
 fig.width = 8 ,
 fig.height = 5,
 fig.align ='center'
)

## ------------------------------------------------------------------------
library("cellWise")

## ------------------------------------------------------------------------
# load the data

X <- robustbase::starsCYG; plot(X)

cutoff <- sqrt(qchisq(0.975, ncol(X)))
X.mean <- colMeans(X)
X.cov  <- cov(X)
cor(X)

locScaleX <- estLocScale(X)
Xw <- wrap(X, locScaleX$loc, locScaleX$scale)$Xw
Xw.mean <- colMeans(Xw)
Xw.cov <- cov(Xw)
cor(Xw)

# classical Mahalanobis distances
# 

md <- sqrt(mahalanobis(X, center = X.mean, cov = X.cov))
plot(1:nrow(X), md, pch = 16, cex = 0.9,
     ylab = "Mahalanobis distance",
     xlab = "Index",
     main = "Mahalanobis distances",
     xlim = c(0, nrow(X)), ylim = c(0, max(md, cutoff) + 0.2), col = "black")
abline(h = cutoff, lwd = 1.5, col = "red")


# wrapping-based robust distances
# 

rd <- sqrt(mahalanobis(X, center = Xw.mean, cov = Xw.cov))
plot(1:nrow(X), rd, pch = 16, cex = 0.9,
     ylab = "robust distance",
     xlab = "Index",
     main = "Wrapping-based robust distances",
     xlim = c(0, nrow(X)), ylim = c(0, max(rd, cutoff) + 0.2), col = "black")
abline(h = cutoff, lwd = 1.5, col = "red")


# classical and wrapped tolerance ellipse
#

ell1 <- ellipse::ellipse(X.cov, centre = X.mean, t = cutoff, npoints = 120)
ell2 <- ellipse::ellipse(Xw.cov, centre = Xw.mean, t = cutoff, npoints = 120)
xmin <- min(min(X[, 1]), min(ell1[, 1]), min(ell2[, 1]))
xmax <- max(max(X[, 1]), max(ell1[, 1]), max(ell2[, 1]))
ymin <- min(min(X[, 2]), min(ell1[, 2]), min(ell2[, 2]))
ymax <- max(max(X[, 2]), max(ell1[, 2]), max(ell2[, 2]))
myxlim <- c(xmin, xmax); myylim <- c(ymin, ymax)
plot(X, xlab = "X1", ylab = "X2", main = "Stars: classical and wrapping ellipse",
     pch = 16, col = "black", xlim = myxlim, ylim = myylim)
points(ell1, type = "l", lwd = 1.5, col = "red")
points(ell2, type = "l", lwd = 1.5, col = "blue")

## ------------------------------------------------------------------------
?robustbase::bushfire
X <- as.matrix(robustbase::bushfire); pairs(X)

cutoff <- sqrt(qchisq(0.975, ncol(X))); cutoff
X.mean <- colMeans(X); X.cov <- cov(X)
round(cor(X), 2)

estX <- cellWise::estLocScale(X)
Xw <- cellWise::wrap(X, estX$loc, estX$scale)$Xw
Xw.mean <- colMeans(Xw); Xw.cov <- cov(Xw)
round(cor(Xw), 2)

wd <- sqrt(mahalanobis(X, center = Xw.mean, cov = Xw.cov))
weights <- (wd < cutoff) + 0
# Reweighting functions:
wmean <- function(X, w) { # weighted mean
  wmean1 <- function(y, w) { sum(y * w) / sum(w) }
  apply(X, 2, FUN = wmean1, w = w)
}
wcov <- function(X, w) { # weighted cov
  Xc <- sweep(X, 2, wmean(X, w), "-")
  Xc <- sweep(Xc, 1, sqrt(w), "*")
  t(Xc) %*% Xc / sum(w)
}
X.wmean <- wmean(X, weights)
X.wcov <- wcov(X, weights)
round(cov2cor(X.wcov), 2)


# Classical Mahalanobis distances
# 
md <- sqrt(mahalanobis(X, center = X.mean, cov = X.cov))
plot(1:nrow(X), md, pch = 16, cex = 0.9,
     ylab = "Mahalanobis distance", xlab = "Index",
     main = "Mahalanobis distances", xlim = c(0, nrow(X)),
     ylim = c(0, max(md, cutoff) + 0.2), col = "black")
abline(h = cutoff, lwd = 1.5, col = "red")
# No outliers stand out here.


# Wrapping-based robust distances
# 
rwd <- sqrt(mahalanobis(X, center = X.wmean, cov = X.wcov))
plot(1:nrow(X),rwd,pch = 16, cex = 0.9,
     ylab = "robust distance", xlab = "Index",
     main = "Wrapping-based robust distances", xlim = c(0, nrow(X)),
     ylim = c(0, max(rwd, cutoff) + 0.2), col = "black")
abline(h = cutoff, lwd = 1.5, col = "red")
# Many outliers are visible, the same as in Maronna-Yohai 1995.


# Distance-distance plot:
#
plot(md, rwd, pch = 16, cex = 0.9, ylab = "robust distance",
     xlab = "classical distance", main = "distance-distance plot",
     xlim = c(0, max(md, cutoff) + 0.2),
     ylim = c(0, max(rwd, cutoff) + 0.2), col = "black")
abline(v = cutoff, lwd = 1.5, col = "red")
abline(h = cutoff, lwd = 1.5, col = "red")
abline(0, 1, lwd = 1.5, lty = 2)
# only the robust distances detect the outliers


# Classical and wrapped tolerance ellipses:
#
coordgrid <- expand.grid(1:dim(X)[2], 1:dim(X)[2])
coordgrid <- coordgrid[-(1 + (1:dim(X)[2] - 1) * (dim(X)[2] + 1)), ]
i = 1
pairs(X, panel = function(x, y) {
        points(x, y)
        inds <- as.numeric(coordgrid[i, ])
        ell1 <- ellipse::ellipse(X.cov[inds, inds], centre = X.mean[inds],
                                 t = cutoff, npoints = 120)
        ell2 <- ellipse::ellipse(X.wcov[inds, inds], centre = X.wmean[inds],
                                 t = cutoff, npoints = 120)
        points(ell1, type = "l", lwd = 1.5, col = "red")
        points(ell2, type = "l", lwd = 1.5, col = "blue")
        i <<- i + 1
      })

## ------------------------------------------------------------------------
data(dog_walker)
# keep a copy of the data for later:
X <- dog_walker

# Combine all pixels of an image in a row:
dims <- dim(X); dims # 54 144 180   3
dim(X) <- c(dims[1], prod(dims[2:4]))
dim(X) #  54 77760

# Estimate location and scale using estLocScale:
locScaleX <- estLocScale(X, precScale = 1e-12)

# Preprocess the data to deal with zeroscales:
zeropix <- which(locScaleX$scale < 1e-12)
nzero <- length(zeropix) 
filler <- 2 * ((1:dims[1]) - (dims[1] + 1) / 2) / (dims[1] - 1)
filler <- 0.9 / 255 * matrix(rep(filler, nzero), ncol = nzero, byrow = F)
centers <- apply(X[, zeropix], 2, FUN = median)
centers <- pmax(0, pmin(1, centers)); 
filler <- sweep(filler, 2, centers, "+")
X[, zeropix] <- filler
locScaleX$scale[zeropix] <- estLocScale(X[, zeropix])$scale

# Wrap the data
Xw <- wrap(X, locScaleX$loc, locScaleX$scale)$Xw

# center the wrapped data
aveXw <- colMeans(Xw)
XwC <- sweep(Xw, 2, aveXw)

# Compute singular value decomposition of centered wrapped data
prcXwz <- svd::propack.svd(XwC, neig = 3) 
rloadings <- prcXwz$v; dim(rloadings) 
Xwscores <- XwC %*% rloadings; dim(Xwscores) 

## Project original data on robust loadings:
XC <- sweep(X, 2, aveXw)
robscores <- XC %*% rloadings

# Compute the fitted frames and residuals:
Xznew.rfitted <- robscores %*% t(rloadings[, 1:3])
X.rfitted <- sweep(Xznew.rfitted, 2, aveXw, "+")
X.rresidual <- X - X.rfitted

# Plot the first loading
rim1 <- pmax(0, pmin(rloadings[, 1] + locScaleX$loc, 1))
dim(rim1) <- dims[2:4]; grid::grid.newpage()
grid::grid.raster(rim1, interpolate = FALSE)

# Compute location and scale of the residuals
res.med <- median(X.rresidual) 
res.mad <-  mad(X.rresidual) 
res <- (X.rresidual - res.med) / res.mad

# Make plots
frameinds <- c(10, 20, 30, 40)
cutoff <- 200
for (i in 1:4) { 
  index <- frameinds[i]
  restemp <- res[index,];
  dim(restemp) <- c(prod(dims[2:3]), dims[4]);
  res2 <- restemp[, 1]^2 + restemp[, 2]^2 + restemp[, 3]^2
  mask <- rep(0, prod(dims[2:3])); mask[res2 > cutoff] <- 1
  mask <- cbind(mask,mask,mask);   dim(mask) <- dims[2:4]
  realim <- dog_walker[index, , , ]; 
  realim <- pmax(0, pmin(realim, 1)); dim(realim) <- dims[2:4]
  masked <- realim * mask; dim(masked)
  masked <- pmax(0, pmin(masked, 1)); dim(masked) <- dims[2:4]
  masked[masked == 0] <- 0.5 
  finalim <- array(0, dim = c(dims[2], 2*dims[3], dims[4]))
  finalim[, 1:dims[3], ] <- realim
  finalim[, (dims[3] + 1):(2 * dims[3]), ] <- masked
  grid::grid.newpage()
  grid::grid.raster(finalim,interpolate = FALSE)
}

