library(qgam)


### Name: qgam
### Title: Fit a smooth additive quantile regression model
### Aliases: qgam

### ** Examples

#####
# Univariate "car" example
####
library(qgam); library(MASS)

# Fit for quantile 0.5 using the best sigma
set.seed(6436)
fit <- qgam(accel~s(times, k=20, bs="ad"), data = mcycle, err = 0.05, qu = 0.5)

# Plot the fit
xSeq <- data.frame(cbind("accel" = rep(0, 1e3), "times" = seq(2, 58, length.out = 1e3)))
pred <- predict(fit, newdata = xSeq, se=TRUE)
plot(mcycle$times, mcycle$accel, xlab = "Times", ylab = "Acceleration", ylim = c(-150, 80))
lines(xSeq$times, pred$fit, lwd = 1)
lines(xSeq$times, pred$fit + 2*pred$se.fit, lwd = 1, col = 2)
lines(xSeq$times, pred$fit - 2*pred$se.fit, lwd = 1, col = 2)   

#####
# Multivariate Gaussian example
####
library(qgam)
set.seed(2)
dat <- gamSim(1,n=400,dist="normal",scale=2)

fit <- qgam(y~s(x0)+s(x1)+s(x2)+s(x3), data=dat, err = 0.05, qu = 0.5)
plot(fit, scale = FALSE, pages = 1)      

######
# Heteroscedastic example
######
## Not run: 
##D set.seed(651)
##D n <- 5000
##D x <- seq(-4, 3, length.out = n)
##D X <- cbind(1, x, x^2)
##D beta <- c(0, 1, 1)
##D sigma =  1.2 + sin(2*x)
##D f <- drop(X %*% beta)
##D dat <- f + rnorm(n, 0, sigma)
##D dataf <- data.frame(cbind(dat, x))
##D names(dataf) <- c("y", "x")
##D 
##D fit <- qgam(list(y~s(x, k = 30, bs = "cr"), ~ s(x, k = 30, bs = "cr")), 
##D             data = dataf, qu = 0.95, lsig = -1.16)
##D 
##D plot(x, dat, col = "grey", ylab = "y")
##D tmp <- predict(fit, se = TRUE)
##D lines(x, tmp$fit[ , 1])
##D lines(x, tmp$fit[ , 1] + 3 * tmp$se.fit[ , 1], col = 2)
##D lines(x, tmp$fit[ , 1] - 3 * tmp$se.fit[ , 1], col = 2)
## End(Not run)




