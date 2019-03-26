library(DiceKriging)


### Name: simulate
### Title: Simulate GP values at any given set of points for a km object
### Aliases: simulate simulate,km-method
### Keywords: models

### ** Examples



# ----------------
# some simulations 
# ----------------

n <- 200
x <- seq(from=0, to=1, length=n)

covtype <- "matern3_2"
coef.cov <- c(theta <- 0.3/sqrt(3))
sigma <- 1.5
trend <- c(intercept <- -1, beta1 <- 2, beta2 <- 3)
nugget <- 0   # may be sometimes a little more than zero in some cases, 
              # due to numerical instabilities

formula <- ~x+I(x^2)    # quadratic trend (beware to the usual I operator)

ytrend <- intercept + beta1*x + beta2*x^2
plot(x, ytrend, type="l", col="black", ylab="y", lty="dashed",
     ylim=c(min(ytrend)-2*sigma, max(ytrend) + 2*sigma))

model <- km(formula, design=data.frame(x=x), response=rep(0,n), 
            covtype=covtype, coef.trend=trend, coef.cov=coef.cov, 
            coef.var=sigma^2, nugget=nugget)
y <- simulate(model, nsim=5, newdata=NULL)

for (i in 1:5) {
  lines(x, y[i,], col=i)
}


# --------------------------------------------------------------------
# conditional simulations and consistancy with Simple Kriging formulas
# --------------------------------------------------------------------

n <- 6
m <- 101
x <- seq(from=0, to=1, length=n)
response <- c(0.5, 0, 1.5, 2, 3, 2.5)

covtype <- "matern5_2"
coef.cov <- 0.1
sigma <- 1.5

trend <- c(intercept <- 5, beta <- -4)
model <- km(formula=~cos(x), design=data.frame(x=x), response=response, 
            covtype=covtype, coef.trend=trend, coef.cov=coef.cov, 
            coef.var=sigma^2)

t <- seq(from=0, to=1, length=m)
nsim <- 1000
y <- simulate(model, nsim=nsim, newdata=data.frame(x=t), cond=TRUE, nugget.sim=1e-5)

## graphics

plot(x, intercept + beta*cos(x), type="l", col="black", 
     ylim=c(-4, 7), ylab="y", lty="dashed")
for (i in 1:nsim) {
	lines(t, y[i,], col=i)
}

p <- predict(model, newdata=data.frame(x=t), type="SK")
lines(t, p$lower95, lwd=3)
lines(t, p$upper95, lwd=3)

points(x, response, pch=19, cex=1.5, col="red")

# compare theoretical kriging mean and sd with the mean and sd of
# simulated sample functions
mean.theoretical <- p$mean
sd.theoretical <- p$sd
mean.simulated <- apply(y, 2, mean) 
sd.simulated <- apply(y, 2, sd)
par(mfrow=c(1,2))
plot(t, mean.theoretical, type="l")
lines(t, mean.simulated, col="blue", lty="dotted")
points(x, response, pch=19, col="red")
plot(t, sd.theoretical, type="l")
lines(t, sd.simulated, col="blue", lty="dotted")
points(x, rep(0, n), pch=19, col="red")
par(mfrow=c(1,1))

# estimate the confidence level at each point
level <- rep(0, m)
for (j in 1:m) {
	level[j] <- sum((y[,j]>=p$lower95[j]) & (y[,j]<=p$upper95[j]))/nsim
}
level    # level computed this way may be completely wrong at interpolation 
         # points, due to the numerical errors in the calculation of the 
         # kriging mean


# ---------------------------------------------------------------------
# covariance kernel + simulations for "exp", "matern 3/2", "matern 5/2" 
#                                 and "exp" covariances
# ---------------------------------------------------------------------

covtype <- c("exp", "matern3_2", "matern5_2", "gauss")

d <- 1
n <- 500
x <- seq(from=0, to=3, length=n)

par(mfrow=c(1,2))
plot(x, rep(0,n), type="l", ylim=c(0,1), xlab="distance", ylab="covariance")

param <- 1
sigma2 <- 1

for (i in 1:length(covtype)) {
	covStruct <- covStruct.create(covtype=covtype[i], d=d, known.covparam="All", 
                      var.names="x", coef.cov=param, coef.var=sigma2)
	y <- covMat1Mat2(covStruct, X1=as.matrix(x), X2=as.matrix(0))
	lines(x, y, col=i, lty=i)
	}
legend(x=1.3, y=1, legend=covtype, col=1:length(covtype), 
       lty=1:length(covtype), cex=0.8)

plot(x, rep(0,n), type="l", ylim=c(-2.2, 2.2), xlab="input, x", 
     ylab="output, f(x)")
for (i in 1:length(covtype)) {
	model <- km(~1, design=data.frame(x=x), response=rep(0,n), covtype=covtype[i], 
		    coef.trend=0, coef.cov=param, coef.var=sigma2, nugget=1e-4)
	y <- simulate(model)
	lines(x, y, col=i, lty=i)
}
par(mfrow=c(1,1))

# -------------------------------------------------------
# covariance kernel + simulations for "powexp" covariance
# -------------------------------------------------------

covtype <- "powexp"

d <- 1
n <- 500
x <- seq(from=0, to=3, length=n)

par(mfrow=c(1,2))
plot(x, rep(0,n), type="l", ylim=c(0,1), xlab="distance", ylab="covariance")

param <- c(1, 1.5, 2)
sigma2 <- 1

for (i in 1:length(param)) {
	covStruct <- covStruct.create(covtype=covtype, d=d, known.covparam="All",
                      var.names="x", coef.cov=c(1, param[i]), coef.var=sigma2)
	y <- covMat1Mat2(covStruct, X1=as.matrix(x), X2=as.matrix(0))
	lines(x, y, col=i, lty=i)
	}
legend(x=1.4, y=1, legend=paste("p=", param), col=1:3, lty=1:3)

plot(x, rep(0,n), type="l", ylim=c(-2.2, 2.2), xlab="input, x", 
     ylab="output, f(x)")
for (i in 1:length(param)) {
	model <- km(~1, design=data.frame(x=x), response=rep(0,n), covtype=covtype, 
        coef.trend=0, coef.cov=c(1, param[i]), coef.var=sigma2, nugget=1e-4)
	y <- simulate(model)
	lines(x, y, col=i)
}
par(mfrow=c(1,1))




