library(VGAM)


### Name: vsmooth.spline
### Title: Vector Cubic Smoothing Spline
### Aliases: vsmooth.spline
### Keywords: regression smooth

### ** Examples

nn <- 20; x <- 2 + 5*(nn:1)/nn
x[2:4] <- x[5:7]  # Allow duplication
y1 <- sin(x) + rnorm(nn, sd = 0.13)
y2 <- cos(x) + rnorm(nn, sd = 0.13)
y3 <- 1 + sin(x) + rnorm(nn, sd = 0.13)  # Run this for constraints
y <- cbind(y1, y2, y3)
ww <- cbind(rep(3, nn), 4, (1:nn)/nn)

(fit <- vsmooth.spline(x, y, w = ww, df = 5))
## Not run: 
##D plot(fit)  # The 1st and 3rd functions do not differ by a constant
## End(Not run)

mat <- matrix(c(1,0,1, 0,1,0), 3, 2)
(fit2 <- vsmooth.spline(x, y, w = ww, df = 5, i.constr = mat,
                        x.constr = mat))
# The 1st and 3rd functions do differ by a constant:
mycols <- c("orange", "blue", "orange")
## Not run:  plot(fit2, lcol = mycols, pcol = mycols, las = 1) 

p <- predict(fit, x = model.matrix(fit, type = "lm"), deriv = 0)
max(abs(depvar(fit) - with(p, y)))  # Should be 0; and fit@y is not good

par(mfrow = c(3, 1))
ux <- seq(1, 8, len = 100)
for (dd in 1:3) {
  pp <- predict(fit, x = ux, deriv = dd)
## Not run: 
##D with(pp, matplot(x, y, type = "l", main = paste("deriv =", dd),
##D                           lwd = 2, ylab = "", cex.axis = 1.5,
##D                           cex.lab = 1.5, cex.main = 1.5)) 
## End(Not run)
}



