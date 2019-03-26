library(logconcens)


### Name: logcon
### Title: Compute log-concave MLE based on censored or exact data.
### Aliases: logcon logconcure logConCens

### ** Examples

# A function for artificially censoring exact data
censor <- function(y, timemat) {
  tm <- cbind(0,timemat,Inf)
  n <- length(y)
  res <- sapply(1:n, function(i){
            return( c( max(tm[i,][tm[i,] < y[i]]), min(tm[i,][tm[i,] >= y[i]]) ) ) } )
  return(t(res))
}



# ------------------------
#  interval censored data
# ------------------------

set.seed(20)
n <- 100
# generate exact data:
y <- rgamma(n,3)
# generate matrix of inspection times:
itimes <- matrix(rexp(10*n),n,10)
itimes <- t(apply(itimes,1,cumsum))
# transform exact data to interval data
x <- censor(y, itimes)
# plot both
plotint(x, imarks=y)

# Compute censored log-concave MLE
# (assuming only the censored data is available to us)
res <- logcon(x)
plot(res)

# Compare it to the log-concave MLE for the exact data
# and to the true Gamma(3,1) log-density
res.ex <- logcon(y)
lines(res.ex$x, res.ex$phi, lwd=2.5, lty=2)
xi <- seq(0,14,0.05)
lines(xi,log(dgamma(xi,3,1)), col=3, lwd=2)



# -------------------------
#  censored data with cure
# -------------------------

## Not run: 
##D set.seed(21)
##D n <- 100
##D # generate exact data:
##D y <- rgamma(n,3)
##D cured <- as.logical(rbinom(n,1,0.3))
##D y[cured] <- Inf
##D 
##D # generate matrix of inspection times:
##D itimes <- matrix(rexp(6*n),n,6)
##D itimes <- t(apply(itimes,1,cumsum))
##D # transform exact data to interval data
##D x <- censor(y, itimes)
##D # plot both
##D plotint(x, imarks=y)
##D 
##D # Compute censored log-concave MLE including cure parameter
##D # (assuming only the censored data is available to us)
##D res <- logcon(x, adapt.p0=TRUE)
##D plot(res)
##D # There is a trade-off between right-hand slope and cure parameter here
##D # (seen by the grey area on the right), but the margin is very small:
##D res$cure.range
##D 
##D # Compare the corresponding CDF to the true CDF
##D plot(res, type="CDF")
##D xi <- seq(0,14,0.05)
##D lines(xi,0.7*pgamma(xi,3,1), col=3, lwd=2)
##D # Note that the trade-off for the right-hand slope is not visible anymore 
##D # (in terms of the CDF the effect is too small)
## End(Not run)



# ------------------------------------
#  real right censored data with cure
# ------------------------------------

# Look at data set ovarian from package survival
# Gives survival times in days for 26 patients with advanced ovarian carcinoma,
# ignoring the covariates

# Bring data to right format and plot it
## Not run: 
##D library(survival)
##D data(ovarian)
##D sobj <- Surv(ovarian$futime, ovarian$fustat)
##D x <- cbind(sobj[,1], ifelse(as.logical(sobj[,2]),sobj[,1],Inf))
##D plotint(x)
##D 
##D # Compute censored log-concave MLE including cure parameter
##D res <- logcon(x, adapt.p0=TRUE)
##D 
##D # Compare the corresponding survival function to the Kaplan-Meier estimator
##D plot(res, type="survival")
##D res.km <- survfit(sobj ~ 1)
##D lines(res.km, lwd=1.5)
## End(Not run)



# ----------------------
#  current status data
# ----------------------

## Not run: 
##D set.seed(22)
##D n <- 200
##D # generate exact data
##D y <- rweibull(n,2,1)
##D # generate vector of inspection times
##D itime <- matrix(rexp(n),n,1)
##D # transform exact data to interval data
##D x <- censor(y, itime)
##D # plot both
##D plotint(x, imarks=y)
##D 
##D # Compute censored log-concave MLE
##D # (assuming only the censored data is available to us)
##D res <- logcon(x)
##D plot(res, type="CDF")
##D 
##D # Compare it to the true Weibull(2,1) c.d.f.
##D xi <- seq(0,3,0.05)
##D lines(xi,pweibull(xi,2,1), col=3, lwd=2)
## End(Not run)



# ----------------------
#  rounded/binned data
# ----------------------

## Not run: 
##D set.seed(23)
##D n <- 100
##D # generate data in [0,1] rounded to one digit
##D y <- round(rbeta(n,2,3),1)
##D # bring data to right format and plot it
##D x <- cbind(y-0.05,y+0.05)
##D plotint(x)
##D 
##D # Compute censored log-concave MLE
##D res <- logcon(x)
##D plot(res, type="density", xlim=c(0,1))
##D 
##D # Compare it to the true Beta(2,3) density
##D xi <- seq(0,1,0.005)
##D lines(xi,dbeta(xi,2,3), col=3, lwd=2)
##D # The peaks in the estimated density are often considered unsatisfactory
##D # However, they are barely noticeable in the c.d.f.
##D plot(res, type="CDF", xlim=c(0,1))
##D lines(xi,pbeta(xi,2,3), col=3, lwd=2)
##D 
##D # To get rid of them in the density apply the smoothing
##D # proposed in the package logcondens (to be implemented here)
## End(Not run)



