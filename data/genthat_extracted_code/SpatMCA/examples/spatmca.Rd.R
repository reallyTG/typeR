library(SpatMCA)


### Name: spatmca
### Title: Regularized spatial MCA
### Aliases: spatmca

### ** Examples

############### 1D: regular locations ################################
p <- q <- 20
n <- 100
x1 <- matrix(seq(-7, 7, length = p), nrow = p, ncol = 1)
x2 <- matrix(seq(-7, 7, length = q), nrow = q, ncol = 1)
u <- exp(-x1^2)/norm(exp(-x1^2), "F")
v <- exp(-(x2 - 2)^2)/norm(exp(-(x2 - 2)^2), "F")
Sigma <- array(0, c(p + q, p + q))
Sigma[1:p, 1:p] <- diag(p)
Sigma[(p + 1):(p + q), (p + 1):(p + q)] <- diag(p)
Sigma[1:p, (p + 1):(p + q)] <- u%*%t(v)
Sigma[(p + 1):(p + q), 1:p] <- t(Sigma[1:p, (p + 1):(p + q)])
noise <- MASS::mvrnorm(n, mu = rep(0, p + q), Sigma = 0.001*diag(p + q))
Y <- MASS:::mvrnorm(n, mu = rep(0, p + q), Sigma = Sigma) + noise
Y1 <- Y[,1:p]
Y2 <- Y[,-(1:p)]
cv1 <- spatmca(x1, x2, Y1, Y2)
par(mfrow=c(2,1))
plot(x1, cv1$Uestfn[,1], type='l', main="1st pattern for Y1")
plot(x1, cv1$Vestfn[,1], type='l', main="1st pattern for Y2")
## Not run: 
##D ### 1D: artificial irregular locations
##D rm_loc1 <- sample(1:p, 10)
##D rm_loc2 <- sample(1:q, 10)
##D x1_rm <- x1[-rm_loc1]
##D x2_rm <- x2[-rm_loc2]
##D Y1_rm <- Y1[,-rm_loc1]
##D Y2_rm <- Y2[,-rm_loc2]
##D x1_new <- as.matrix(seq(-7, 7, length = 100))
##D x2_new <- as.matrix(seq(-7, 7, length = 50))
##D cv2 <- spatmca(x1 = x1_rm, x2 = x2_rm, Y1 = Y1_rm, Y2 = Y2_rm, x1_new = x1_new, x2_new = x2_new)
##D par(mfrow=c(2,1))
##D plot(x1_new, cv2$Uestfn[,1], type='l', main="1st pattern for Y1")
##D plot(x2_new, cv2$Vestfn[,1], type='l', main="1st pattern for Y2")
##D 
##D ###############################2D real data#########################################
##D # Daily 8-hour ozone averages and maximum temperature obtained from 28 monitoring 
##D # sites of NewYork, USA. It is of interest to see the relationship between the ozone
##D # and the temperature through the coupled patterns.
##D ####################################################################################
##D library(spTimer)
##D library(pracma)
##D data(NYdata)
##D NYsite <- unique(cbind(NYdata[,1:3]))
##D date <- as.POSIXct(seq(as.Date("2006-07-01"), as.Date("2006-08-31"), by = 1))
##D cMAXTMP<- matrix(NYdata[,8], 62, 28)
##D oz <- matrix(NYdata[,7], 62, 28)
##D rmna <- !colSums(is.na(oz))
##D temp <- detrend(matrix(cMAXTMP[,rmna], nrow = nrow(cMAXTMP)), "linear")
##D ozone <- detrend(matrix(oz[,rmna], nrow = nrow(oz)), "linear")
##D x1 <- NYsite[rmna, 2:3]
##D cv <- spatmca(x1, x1, temp, ozone)
##D par(mfrow=c(2,1))
##D quilt.plot(x1, cv$Uestfn[,1], xlab = "longitude", ylab = "latitude", 
##D main = "1st spatial pattern for temperature")
##D  map(database = "state", regions = "new york", add = T)
##D quilt.plot(x1, cv$Vestfn[,1], xlab = "longitude", ylab = "latitude",
##D  main = "1st spatial pattern for ozone")
##D map(database = "state", regions = "new york", add = T)
##D 
##D ###Time series for the coupled patterns
##D tstemp <- temp%*%cv$Uestfn[,1]
##D tsozone <- ozone%*%cv$Vestfn[,1]
##D corr <- cor(tstemp, tsozone)
##D plot(date, tstemp/sd(tstemp), type='l', main = "Time series", ylab = "", xlab = "month")
##D lines(date, tsozone/sd(tsozone),col=2)
##D legend("bottomleft", c("Temperature (standardized)", "Ozone (standardized)"), col = 1:2, lty = 1:1)
##D mtext(paste("Pearson's correlation = ", round(corr,3)), 3)
##D 
##D ###new locations
##D new_p = 50
##D x_lon <- seq(-80, -72, length = new_p)
##D x_lat <- seq(41, 45, length = new_p)
##D xx_new <- as.matrix(expand.grid(x = x_lon, y = x_lat))
##D cv_new <- spatmca(x1,x1, temp, ozone, K = cv$Khat, tau1u = cv$stau1u, tau1v = 
##D cv$stau1v, tau2u = cv$stau2u, tau2v = cv$stau2v, x1_new = xx_new, x2_new = xx_new)
##D par(mfrow=c(2,1))
##D quilt.plot(xx_new, cv_new$Uestfn[,1], nx = new_p, ny = new_p, xlab = "longitude", 
##D ylab = "latitude", main = "1st spatial pattern for temperature")
##D map(database="county", regions="new york", add = T)
##D map.text("state", regions="new york", cex = 2, add = T)
##D quilt.plot(xx_new, cv_new$Vestfn[,1], nx = new_p, ny = new_p,  xlab = "longitude",
##D ylab = "latitude", main = "2nd spatial pattern for ozone")
##D map(database="county", regions="new york", add = T)
##D map.text("state", regions="new york", cex = 2, add = T)
##D 
##D ###### 3D: regular locations
##D n <- 200
##D x <- y <- z <- as.matrix(seq(-7, 7, length = 8))
##D d <- expand.grid(x, y, z)
##D u_3D <- v_3D <- exp(-d[,1]^2 - d[,2]^2 -d[,3]^2)
##D p <- q <- 8^3
##D Sigma_3D <- array(0, c(p + q, p + q))
##D Sigma_3D[1:p, 1:p] <- diag(p)
##D Sigma_3D[(p + 1):(p + q), (p + 1):(p + q)] <- diag(p)
##D Sigma_3D[1:p, (p + 1):(p + q)] <- u_3D%*%t(v_3D)
##D Sigma_3D[(p + 1):(p + q), 1:p] <- t(Sigma_3D[1:p, (p + 1):(p + q)])
##D 
##D noise_3D <- MASS::mvrnorm(n, mu = rep(0, p + q), Sigma = 0.001*diag(p + q))
##D Y_3D <- MASS:::mvrnorm(n, mu = rep(0, p + q), Sigma = Sigma_3D) + noise_3D
##D Y1_3D <- Y_3D[,1:p]
##D Y2_3D <- Y_3D[,-(1:p)]
##D cv_3D <- spatmca(d, d, Y1_3D, Y2_3D)
##D 
##D library(plot3D)
##D library(RColorBrewer) 
##D cols <- colorRampPalette(brewer.pal(9,'Blues'))(10)
##D isosurf3D(x, y, z, colvar = array(cv_3D$Uestfn[,1], c(8, 8, 8)),
##D             level= seq(min(cv_3D$Uestfn[,1]), max(cv_3D$Uestfn[,1]), length=10),
##D             ticktype = "detailed",
##D             colkey = list(side = 1),
##D             col = cols,
##D             main = "1st estimated pattern for Y1")
##D             
##D isosurf3D(x, y, z, colvar = array(cv_3D$Vestfn[,1], c(8, 8, 8)),
##D             level= seq(min(cv_3D$Vestfn[,1]), max(cv_3D$Vestfn[,1]), length=10),
##D             ticktype = "detailed",
##D             colkey = list(side = 1),
##D             col = cols,
##D             main = "1st estimated pattern for Y2")
## End(Not run)



