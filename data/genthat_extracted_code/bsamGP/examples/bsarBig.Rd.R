library(bsamGP)


### Name: bsarBig
### Title: Bayesian Spectral Analysis Regression for Big data
### Aliases: bsarBig
### Keywords: Big Data Gaussian processes

### ** Examples

# Ttrue function
ftrue <- function(x){
  ft <- 7*exp(-3*x) + 2*exp(-70*(x-.6)^2) - 2 + 5*x
  return(ft)
}

# Generate data
set.seed(1)

nobs <- 100000 # Number of observations
sigmat <- .5 # True sigma
nxgrid <- 500 # number of grid points: approximate likelihood & plots

xdata <- runif(nobs) # Generate x values
fobst <- ftrue(xdata) # True f at observations
ydata <- fobst + sigmat*rnorm(nobs)

# Compute grid on 0 to 1
xdelta <- 1/nxgrid
xgrid <- seq(xdelta/2, 1-xdelta/2, xdelta)
xgrid <- matrix(xgrid,nxgrid)
fxgridt <- ftrue(xgrid) # True f on xgrid

# Fit data
fout <- bsarBig(ydata ~ xdata, nbasis = 50, nint = nxgrid, verbose = TRUE)

# Plots
smcmc <- fout$mcmc$smcmc
t <- 1:smcmc
par(mfrow=c(2,2))
matplot(t, fout$mcmc.draws$theta, type = "l", main = "Theta", xlab = "Iteration", ylab = "Draw")
plot(t, fout$mcmc.draws$sigma, type = "l", main = "Sigma", xlab = "Iteration", ylab = "Draw")
matplot(t, fout$mcmc.draws$tau, type = "l", main = "Tau", xlab = "Iteration", ylab = "Draw")
matplot(t, fout$mcmc.draws$gamma, type = "l", main = "Gamma", xlab = "Iteration", ylab = "Draw")

dev.new()
matplot(fout$fit.draws$xgrid, cbind(fxgridt, fout$post.est$fhatm, fout$post.est$fhatq),
        type = "l", main = "Regression Function", xlab = "X", ylab = "Y")

# Compute RMISE for regression function
sse <- (fout$post.est$fhatm - fxgridt)^2
rmise <- intgrat(sse, 1/nxgrid)
rmise <- sqrt(rmise)
rmise



