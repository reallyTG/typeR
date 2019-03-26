library(spatialprobit)


### Name: sartobit
### Title: Bayesian estimation of the SAR Tobit model
### Aliases: sartobit sar_tobit_mcmc

### ** Examples

## Not run: 
##D # Example from LeSage/Pace (2009), section 10.3.1, p. 302-304
##D # Value of "a" is not stated in book! 
##D # Assuming a=-1 which gives approx. 50##D 
##D library(spatialprobit)
##D 
##D a <- -1   # control degree of censored observation
##D n <- 1000
##D rho <- 0.7
##D beta <- c(0, 2)
##D sige <- 0.5
##D I_n <- sparseMatrix(i=1:n, j=1:n, x=1)
##D x <- runif(n, a, 1)
##D X <- cbind(1, x)
##D eps <- rnorm(n, sd=sqrt(sige))
##D param <- c(beta, sige, rho)
##D 
##D # random locational coordinates and 6 nearest neighbors
##D lat <- rnorm(n)
##D long <- rnorm(n)
##D W <- kNearestNeighbors(lat, long, k=6)
##D 
##D y <- as.double(solve(I_n - rho * W) %*% (X %*% beta + eps))
##D table(y > 0)
##D 
##D # full information
##D yfull <- y
##D 
##D # set negative values to zero to reflect sample truncation
##D ind <- which(y <=0)
##D y[ind] <- 0
##D 
##D # Fit SAR (with complete information)
##D fit_sar <- sartobit(yfull ~ X-1, W,ndraw=1000,burn.in=200, showProgress=FALSE)
##D summary(fit_sar)
##D 
##D # Fit SAR Tobit (with approx. 50% censored observations)
##D fit_sartobit <- sartobit(y ~ x,W,ndraw=1000,burn.in=200, showProgress=TRUE)
##D 
##D par(mfrow=c(2,2))
##D for (i in 1:4) {
##D  ylim1 <- range(fit_sar$B[,i], fit_sartobit$B[,i])
##D  plot(fit_sar$B[,i], type="l", ylim=ylim1, main=fit_sartobit$names[i], col="red")
##D  lines(fit_sartobit$B[,i], col="green")
##D  legend("topleft", legend=c("SAR", "SAR Tobit"), col=c("red", "green"), 
##D    lty=1, bty="n")
##D }
##D 
##D # Fit SAR Tobit (with approx. 50% censored observations)
##D fit_sartobit <- sartobit(y ~ x,W,ndraw=1000,burn.in=0, showProgress=TRUE, 
##D     computeMarginalEffects=TRUE)
##D # Print SAR Tobit marginal effects
##D impacts(fit_sartobit)
##D #--------Marginal Effects--------
##D #
##D #(a) Direct effects
##D #  lower_005 posterior_mean upper_095
##D #x     1.013          1.092     1.176
##D #
##D #(b) Indirect effects
##D #  lower_005 posterior_mean upper_095
##D #x     2.583          2.800     3.011
##D #
##D #(c) Total effects
##D #  lower_005 posterior_mean upper_095
##D #x     3.597          3.892     4.183
##D #mfx <- marginal.effects(fit_sartobit)
## End(Not run)



