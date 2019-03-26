library(tvReg)


### Name: tvAR
### Title: Time-Varying Autoregressive Model
### Aliases: tvAR tvar-class tvar

### ** Examples

## Simulate an tvAR(2) process
## Not run: 
##D tt <- (1:1000)/1000
##D beta <- cbind( 0.5 * cos (2 * pi * tt), (tt - 0.5)^2)
##D y <- numeric(1000)
##D y[1] <- 0.5
##D y[2] <- -0.2
##D 
##D ## y(t) = beta1(t) y(t-1) + beta2(t) y(t-2) + ut
##D 
##D for (t in 3:1000)
##D {
##D   y[t] <- y[(t-1):(t-2)] %*% beta[t,] + rnorm(1)
##D }
##D Y <- tail (y, 600)
##D 
##D ## Estimate coefficients of Y with ar.ols and tvAR
##D 
##D tvAR.2p <- tvAR(Y, p = 2, type = "none", est = "ll")
##D AR.2p <- ar.ols(Y, aic = FALSE, order = 2, 
##D intercept = FALSE, demean = FALSE )
##D 
##D ##Compare methodologies in a plot
##D ylim <- range(tvAR.2p$tvcoef[, 1], tail(beta[, 1], 600))
##D plot(tail(beta[, 1], 600), ylim = ylim, xlab = "", ylab = "", cex = 0.5)
##D abline(h = AR.2p$ar[1], col = 2)
##D lines(tvAR.2p$tvcoef[, 1], col = 4)
##D legend("topleft", c(expression(beta[1]),"AR", "tvAR"), col = c(1, 2, 4),
##D lty = 1, bty = "n")
##D 
##D ## Estimate only coefficient from odd lags and the intercept
##D tvAR.6p <- tvAR(Y, p = 6, type = "const",
##D fixed = c(NA, 0, NA, 0, NA, 0, NA), est = "ll")
##D 
##D ## Generation of model with coefficients depending 
##D ## on a random variable
##D z <- arima.sim(n = 1000, list(ma = c(-0.2279, 0.2488)))
##D beta <- (z - 0.5)^2
##D y <- numeric(1000)
##D y[1] <- -1
##D 
##D ##y(t) = beta1(z(t)) y(t-1) + ut
##D  
##D for (t in 3:1000)
##D {
##D   y[t] <- y[(t-1)] %*% beta[t] + rnorm(1)
##D }
##D Y <- tail (y, 600)
##D Z <- tail(z, 600)
##D 
##D ## Estimate coefficients of process Y with ar.ols and tvAR
##D 
##D tvAR.2p.z <- tvAR(Y, z = Z, p = 1, type = "none", est = "ll")
##D AR.2p <- ar.ols(Y, aic = FALSE, order = 1, intercept = FALSE, 
##D          demean = FALSE)
##D 
##D #' ## Estimate coefficients of different realized variance models
##D data("RV")
##D Date <- tail(as.Date(RV$Date), 2000)
##D RVt <- tail(RV$RVt, 2000)
##D RV_week <- tail(RV$RVt_1_5, 2000)
##D RV_month <- tail(RV$RVt_1_22, 2000)
##D RQ <- 1/tail(RV$RQt_1_sqrt, 2000)
##D ##Corsi (2009) HAR model
##D HAR <- arima(RVt, order = c(1, 0, 0), xreg = cbind (RV_week, RV_month))
##D summary(HAR)
##D 
##D ##Chen et al (2017) TVC-HAR model 
##D TVCHAR <- tvAR (RVt, p = 1, exogen = cbind (RV_week, RV_month), bw = 1.83)
##D plot(TVCHAR)
##D summary(TVCHAR)
## End(Not run)




