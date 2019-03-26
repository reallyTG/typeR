library(ismev)


### Name: gamGPDfitboot
### Title: Smooth Parameter Estimation and Bootstrapping of Generalized
###   Pareto Distributions with Penalized Maximum Likelihood Estimation
### Aliases: gamGPDfit gamGPDboot
### Keywords: generalized Pareto distribution distribution multivariate

### ** Examples

### Example 1: fitting capability ##############################################

## generate an example data set
years <- 2003:2012 # years
nyears <- length(years)
n <- 250 # sample size for each (different) xi
u <- 200 # threshold
rGPD <- function(n, xi, beta) ((1-runif(n))^(-xi)-1)*beta/xi # sampling GPD

set.seed(17) # setting seed
xi.true.A <- seq(0.4, 0.8, length=nyears) # true xi for group "A"
## generate losses for group "A"
lossA <- unlist(lapply(1:nyears,
                       function(y) u + rGPD(n, xi=xi.true.A[y], beta=1)))
xi.true.B <- xi.true.A^2 # true xi for group "B"
## generate losses for group "B"
lossB <- unlist(lapply(1:nyears,
                       function(y) u + rGPD(n, xi=xi.true.B[y], beta=1)))
## build data frame
time <- rep(rep(years, each=n), 2) # "2" stands for the two groups
covar <- rep(c("A","B"), each=n*nyears)
value <- c(lossA, lossB)
x <- data.frame(covar=covar, time=time, value=value)

## fit
eps <- 1e-3 # to decrease the run time for this example
fit <- gamGPDfit(x, threshold=u, datvar="value", xiFrhs=~covar+s(time)-1,
                 nuFrhs=~covar+s(time)-1, epsxi=eps, epsnu=eps)
## note: choosing s(..., bs="cr") will fit cubic splines

## grab the fitted values per group and year
xi.fit <- fitted(fit$xiObj)
xi.fit. <- xi.fit[1+(0:(2*nyears-1))*n] # pick fit for each group and year
xi.fit.A <- xi.fit.[1:nyears] # fit for "A" and each year
xi.fit.B <- xi.fit.[(nyears+1):(2*nyears)] # fit for "B" and each year

## plot the fitted values of xi and the true ones we simulated from
par(mfrow=c(1,2))
plot(years, xi.true.A, type="l", ylim=range(xi.true.A, xi.fit.A),
     main="Group A", xlab="Year", ylab=expression(xi))
points(years, xi.fit.A, type="l", col="red")
legend("topleft", inset=0.04, lty=1, col=c("black", "red"),
       legend=c("true", "fitted"), bty="n")
plot(years, xi.true.B, type="l", ylim=range(xi.true.B, xi.fit.B),
     main="Group B", xlab="Year", ylab=expression(xi))
points(years, xi.fit.B, type="l", col="blue")
legend("topleft", inset=0.04, lty=1, col=c("black", "blue"),
       legend=c("true", "fitted"), bty="n")

## Not run: 
##D ### Example 2: Comparison of (the more general) gamGPDfit() with gpd.fit() ########
##D 
##D set.seed(17) # setting seed
##D xi.true.A <- rep(0.4, length=nyears)
##D xi.true.B <- rep(0.8, length=nyears)
##D ## generate losses for group "A"
##D lossA <- unlist(lapply(1:nyears,
##D                        function(y) u + rGPD(n, xi=xi.true.A[y], beta=1)))
##D ## generate losses for group "B"
##D lossB <- unlist(lapply(1:nyears,
##D                        function(y) u + rGPD(n, xi=xi.true.B[y], beta=1)))
##D ## build data frame
##D x <- data.frame(covar=covar, time=time, value=c(lossA, lossB))
##D 
##D ## fit with gpd.fit
##D fit.coles <- gpd.fit(x$value, threshold=u, shl=1, sigl=1, ydat=x)
##D xi.fit.coles.A <- fit.coles$mle[3]+1*fit.coles$mle[4]
##D xi.fit.coles.B <- fit.coles$mle[3]+2*fit.coles$mle[4]
##D 
##D ## fit with gamGPDfit()
##D fit <- gamGPDfit(x, threshold=u, datvar="value", xiFrhs=~covar, nuFrhs=~covar,
##D                  epsxi=eps, epsnu=eps)
##D xi.fit <- fitted(fit$xiObj)
##D xi.fit.A <- as.numeric(xi.fit[1]) # fit for group "A"
##D xi.fit.B <- as.numeric(xi.fit[nyears*n+1]) # fit for group "B"
##D 
##D ## comparison
##D xi.fit.A-xi.fit.coles.A
##D xi.fit.B-xi.fit.coles.B
## End(Not run) # dontrun



