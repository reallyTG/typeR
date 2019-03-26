library(SpatPCA)


### Name: spatpca
### Title: Regularized PCA for spatial data
### Aliases: spatpca

### ** Examples

###### 1D: regular locations
x_1D <- as.matrix(seq(-5, 5, length = 50))
Phi_1D <- exp(-x_1D^2)/norm(exp(-x_1D^2), "F")
set.seed(1234)
Y_1D <- rnorm(n = 100, sd = 3)%*%t(Phi_1D) + matrix(rnorm(n = 100*50), 100, 50)
cv_1D <- spatpca(x = x_1D, Y = Y_1D)
plot(x_1D, cv_1D$eigenfn[,1], type='l', main="1st eigenfunction")
lines(x_1D, svd(Y_1D)$v[,1], col='red')
legend('topleft', c('SpatPCA', 'PCA'), lty=1:1, col=1:2)

## Not run: 
##D ### 1D: artificial irregular locations
##D rm_loc <- sample(1:50, 20)
##D x_1Drm <- x_1D[-rm_loc]
##D Y_1Drm <- Y_1D[,-rm_loc]
##D x_1Dnew <- as.matrix(seq(-5, 5, length = 100))
##D cv_1D <- spatpca(x = x_1Drm, Y = Y_1Drm, tau2 = 1:100, x_new = x_1Dnew)
##D plot(x_1Dnew, cv_1D$eigenfn, type = 'l', main="eigenfunction")
##D plot(cv_1D$Yhat[,50], xlab = "n", ylab = "Yhat", type='l', 
##D     main= paste("prediction at x = ", x_1Dnew[50]))
##D 
##D ###### 2D: Daily 8-hour ozone averages for sites in the Midwest (USA)
##D library(fields)
##D library(pracma)
##D data(ozone2)
##D x <- ozone2$lon.lat
##D Y <- ozone2$y
##D date <- as.Date(ozone2$date, format = '%y%m%d')
##D rmna <- !colSums(is.na(Y))
##D YY <- matrix(Y[, rmna], nrow=nrow(Y))
##D YY <- detrend(YY, "linear")
##D xx <- x[rmna,]
##D cv <- spatpca(x = xx, Y = YY)
##D quilt.plot(xx, cv$eigenfn[,1])
##D map("state", xlim = range(xx[,1]), ylim = range(xx[,2]), add = T)
##D map.text("state", xlim = range(xx[,1]), ylim = range(xx[,2]), cex = 2, add = T)
##D plot(date, YY%*%cv$eigenfn[,1], type = "l", ylab = "1st Principal Component")
##D 
##D ### new loactions
##D new_p = 200
##D x_lon <- seq(min(xx[,1]), max(xx[,1]), length = new_p)
##D x_lat <- seq(min(xx[,2]), max(xx[,2]), length = new_p)
##D xx_new <- as.matrix(expand.grid(x = x_lon, y = x_lat))
##D eof <- spatpca(x = xx, Y = YY, K = cv$Khat, tau1 = cv$stau1, tau2 = cv$stau2, x_new = xx_new)
##D quilt.plot(xx_new, eof$eigenfn[,1], nx = new_p, ny = new_p, xlab = "lon.", ylab = "lat.")
##D map("state", xlim = range(x_lon), ylim = range(x_lat), add = T)
##D map.text("state", xlim = range(x_lon), ylim = range(x_lat), cex = 2, add = T)
##D 
##D ###### 3D: regular locations
##D x = y = z = as.matrix(seq(-5, 5, length = 10))
##D d = expand.grid(x, y, z)
##D Phi_3D <- exp(-d[,1]^2 - d[,2]^2 -d[,3]^2)/norm(exp(-d[,1]^2 - d[,2]^2 -d[,3]^2), "F")
##D Y_3D <- rnorm(n = 1000, sd = 3)%*%t(Phi) + matrix(rnorm(n = 100*10^3), 100, 10^3)
##D cv_3D <- spatpca(x = d, Y = Y_3D, tau2 = seq(0, 1000, length=10))
##D 
##D library(plot3D)
##D library(RColorBrewer)
##D cols <- colorRampPalette(brewer.pal(9,'Blues'))(10)
##D isosurf3D(x, y, z, colvar = array(cv_3D$eigenfn[,1], c(p, p, p)),
##D             level= seq(min(cv_3D$eigenfn[,1]), max(cv_3D$eigenfn[,1]), length=10),
##D             ticktype = "detailed",
##D             colkey = list(side = 1),
##D             col = cols)
## End(Not run)


