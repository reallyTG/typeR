library(groc)


### Name: groc
### Title: groc method
### Aliases: groc groc.default
### Keywords: distribution htest

### ** Examples


## Not run: 
##D library(MASS)
##D ########################
##D # Codes for Example 1  #
##D ########################
##D require("groc")
##D data("wood")
##D out <- groc(y ~ x1 + x2 + x3 + x4 + x5, ncomp = 1, data = wood, 
##D              D = corrob, method = "lts")
##D corrob(wood$y, fitted(out)) ^ 2
##D plot(out)
##D 
##D ########################
##D # Codes for Example 2  #
##D ########################
##D data("trees")
##D out <- groc(Volume ~ Height + Girth, ncomp = 1, D = spearman, 
##D              method = "s", data = trees)
##D cor(trees$Volume, fitted(out)) ^ 2
##D plot(out$T, trees$Volume, xlab = "First component",
##D      ylab = "Volume", pch = 20)
##D lines(sort(out$T), fitted(out)[order(out$T)])
##D out <- boxcox(Volume ~ Height + Girth, data = trees, 
##D               lambda = seq(-0.5, 0.5, length = 100), plotit = FALSE)
##D lambda <- out$x[which.max(out$y)]
##D out <- lm(Volume ^ lambda ~ Height + Girth, data = trees)
##D cor(trees$Volume, fitted(out)^(1/lambda)) ^ 2
##D 
##D ########################
##D # Codes for Example 3  #
##D ########################
##D data("wood")
##D plsr.out <- plsr(y ~ x1 + x2 + x3 + x4 + x5, data = wood)
##D groc.out <- groc(y ~ x1 + x2 + x3 + x4 + x5, data = wood)
##D apply(abs((fitted(plsr.out) - fitted(groc.out)) / 
##D           fitted(plsr.out)), 3, max) * 100
##D 
##D ########################
##D # Codes for Example 4  #
##D ########################
##D set.seed(1)
##D n <- 200
##D x1 <- runif(n, -1, 1)
##D x2 <- runif(n, -1, 1)
##D y <- x1 * x2 + rnorm(n, 0, sqrt(.04))
##D data <- data.frame(x1 = x1, x2 = x2, y = y)
##D plsr.out <- plsr(y ~ x1 + x2, data = data)
##D groc.out <- groc(y ~ x1 + x2, D = dcov, method = "s", data = data)
##D plsr.v <- crossval(plsr.out, segment.type = "consecutive")
##D groc.v <- grocCrossval(groc.out, segment.type = "consecutive")
##D groc.v$validation$PRESS
##D plsr.v$validation$PRESS
##D gam.data <- data.frame(y = y, t1 = groc.out$T[, 1], t2 = groc.out$T[, 2])
##D gam.out <- gam(y ~ s(t1) + s(t2), data = gam.data)
##D par(mfrow = c(1, 2))
##D plot(gam.out)
##D par(mfrow = c(1, 1))
##D PRESS <- 0
##D for(i in 1 : 10){
##D   data.in <- data[-(((i - 1) * 20 + 1) : (i * 20)), ]
##D   data.out <- data[((i - 1) * 20 + 1) : (i * 20), ]
##D   ppr.out <- ppr(y ~ x1 + x2, nterms = 2, optlevel = 3, data = data.in)
##D   PRESS <- PRESS + sum((predict(ppr.out, newdata = data.out)-data.out$y) ^ 2)
##D }
##D PRESS
##D 
##D ########################
##D # Codes for Example 5  #
##D ########################
##D data("yarn")
##D dim(yarn$NIR)
##D n <- nrow(yarn)
##D system.time(plsr.out <- plsr(density ~ NIR, ncomp = n - 2, data = yarn))
##D system.time(groc.out <- groc(density ~ NIR, Nc = 20, ncomp = n - 2, data = yarn))
##D max(abs((fitted(plsr.out) - fitted(groc.out)) / fitted(plsr.out))) * 100
##D plsr.v <- crossval(plsr.out, segments = n, trace = FALSE)
##D plsr.v$validation$PRESS
##D groc.v <- grocCrossval(groc.out, segments = n, trace = FALSE)
##D groc.v$validation$PRESS
##D groc.v$validation$PREMAD
##D 
##D ########################
##D # Codes for Example 6  #
##D ########################
##D data("prim7")
##D prim7.out <- groc(X1 ~ ., ncomp = 3, D = dcov, method = "s", data = prim7)
##D prim7.out$R
##D pca <- princomp(~ ., data = as.data.frame(prim7[, -1]))
##D prim7.pca <- data.frame(X1 = prim7$X1, scores = pca$scores)
##D prim7.pca.out <- groc(X1 ~ ., ncomp = 3, D = dcov, method = "s", 
##D                        data = prim7.pca)
##D pca$loadings ##D 
##D groc.v <- grocCrossval(prim7.out, segment.type = "consecutive")
##D groc.v$validation$PRESS
##D plsr.out <- plsr(X1 ~ ., ncomp = 3, data = prim7)
##D plsr.v <- crossval(plsr.out, segment.type = "consecutive")
##D plsr.v$validation$PRESS
##D PRESS <- 0
##D for(i in 1 : 10){
##D   data.in <- prim7[-(((i - 1) * 50 + 1) : (i * 50)), ]
##D   data.out <- prim7[((i - 1) * 50 + 1) : (i * 50), ]
##D   ppr.out <- ppr(X1 ~ ., nterms = 3, optlevel = 3, data = data.in)
##D   PRESS <- PRESS + sum((predict(ppr.out, newdata = data.out) - data.out$X1) ^ 2)
##D }
##D PRESS
##D 
##D ########################
##D # Codes for Example 7  #
##D ########################
##D n <- 50 ; B <- 30
##D mat.cor <- matrix(0, nrow = B, ncol = 3) ; mat.time <- matrix(0, nrow = B, ncol = 3)
##D for (i in 1:B) {
##D  X <- matrix(runif(n * 5, -1, 1), ncol = 5)
##D  A <- matrix(runif(n * 50, -1, 1), nrow = 5)
##D  y <- (X[,1] + X[,2])^2 + (X[,1] + 5 * X[,2])^2 + rnorm(n)
##D  X <- cbind(X, X ##D 
##D  D <- data.frame(X = X, y = y)
##D  mat.time[i,1] <- system.time(out1 <- plsr(y ~ X, , ncomp = 2, data = D))[1]
##D  mat.time[i,2] <- system.time(out2 <- ppr(y ~ X, , nterms = 2, data = D))[1]
##D  mat.time[i,3] <- system.time(out3 <- groc(y ~ X, D = dcov, method = "s", ncomp = 2, data = D))[1]
##D  mat.cor[i,] <- cor(y, cbind(fitted(out1)[,,2], fitted(out2), fitted(out3)[,,2]))
##D }
##D colMeans(mat.cor)
##D colMeans(mat.time)
##D 
##D ########################
##D # Codes for Example 8  #
##D ########################
##D data("oliveoil")
##D n <- nrow(oliveoil)
##D plsr.out <- plsr(sensory ~ chemical, data = oliveoil, method = "simpls")
##D groc.out <- groc(sensory ~ chemical, data = oliveoil)
##D max(abs((fitted(plsr.out) - fitted(groc.out)) / fitted(plsr.out))) * 100
##D groc.v <- grocCrossval(groc.out, segments = n)
##D groc.v$validation$PRESS
##D colMeans(groc.v$validation$PRESS)
##D Y <- oliveoil$sensory
##D for (j in 1 : ncol(Y)) print(cor(Y[, j], fitted(groc.out)[, j, 2]))
##D 
##D ########################
##D # Codes for Example 9  #
##D ########################
##D require("ppls")
##D data("cookie")
##D X <- as.matrix(log(cookie[1 : 40, 51 : 651]))
##D Y <- as.matrix(cookie[1 : 40, 701 : 704])
##D X <- X[, 2 : 601] - X[, 1 : 600]
##D data <- data.frame(Y = I(Y), X = I(X))
##D n <- nrow(data)
##D q <- ncol(Y)
##D xl <- "Wavelength index"
##D yl <- "First differences of log(1/reflectance)"
##D matplot(1:ncol(X), t(X), lty = 1, xlab = xl, ylab = yl, type = "l")
##D out1 <- plsr(Y ~ X, ncomp = n - 2, data = data)
##D cv <- crossval(out1, segments = n)
##D cv.mean <- colMeans(cv$validation$PRESS)
##D plot(cv.mean, xlab = "h", ylab = "Average PRESS", pch = 20)
##D h <- 3
##D for (j in 1 : q) print(cor(Y[, j], fitted(out1)[, j, h]))
##D set.seed(1)
##D out2 <- groc(Y ~ X, ncomp = h, data = data, plsrob = TRUE)
##D for (j in 1 : q) print(corrob(Y[, j], fitted(out2)[, j, h]))
##D plot(out2)
##D 
##D ########################
##D # Codes for Example 10 #
##D ########################
##D set.seed(2)
##D n <- 30
##D t1 <- sort(runif(n, -1, 1))
##D y <- t1 + rnorm(n, mean = 0, sd = .05)
##D y[c(14, 15, 16)] <- y[c(14, 15, 16)] + .5
##D data <- data.frame(x1 = t1, x2 = 2 * t1, x3 = -1.5 * t1, y = y)
##D out <- groc(y ~ x1 + x2 + x3, ncomp = 1, data = data, plsrob = TRUE)
##D tau <- scaleTau2(residuals(out), mu.too = TRUE)
##D std.res <- scale(residuals(out), center = tau[1], scale = tau[2])
##D index <- which(abs(std.res)>3)
##D prm.res <- read.table("prmresid.txt")
##D plot(t1, y, pch = 20)
##D matlines(t1, cbind(t1,fitted(out), y - prm.res), lty = 1 : 3)
##D legend(.4, -.5 , legend = c("true model","groc", "prm"), lty = 1 : 3)
##D text(t1[index], y[index], index, cex = .8, pos = 3)
##D 
##D ########################
##D # Codes for Example 11 #
##D ########################
##D data("pulpfiber")
##D X <- as.matrix(pulpfiber[, 1:4])
##D Y <- as.matrix(pulpfiber[, 5:8])
##D data <- data.frame(X = I(X), Y = I(Y))
##D set.seed(55481)
##D out.rob <- groc(Y ~ X, data = data, plsrob = TRUE)
##D plot(out.rob, cex = .6)
##D out.simpls <- groc(Y ~ X, data = data)
##D cv.rob <- grocCrossval(out.rob,segment.type = "consecutive")
##D PREMAD.rob <- cv.rob$validation$PREMAD[,4]
##D PREMAD.rob
##D cv.simpls <- grocCrossval(out.simpls,segment.type = "consecutive")
##D PREMAD.simpls <- cv.simpls$validation$PREMAD[,4]
##D PREMAD.simpls
##D (PREMAD.rob - PREMAD.simpls) / PREMAD.simpls * 100
## End(Not run)




