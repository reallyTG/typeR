library(PLRModels)


### Name: plrm.est
### Title: Semiparametric estimates for the unknown components of the
###   regression function in PLR models
### Aliases: plrm.est
### Keywords: Statistical Inference Regression Time Series Nonparametric
###   Statistics

### ** Examples

# EXAMPLE 1: REAL DATA
data(barnacles1)
data <- as.matrix(barnacles1)
data <- diff(data, 12)
data <- cbind(data,1:nrow(data))

b.h <- plrm.gcv(data)$bh.opt
ajuste <- plrm.est(data=data, b=b.h[1], h=b.h[2])
ajuste$beta
plot(data[,4], ajuste$m, type="l", xlab="t", ylab="m(t)")

plot(data[,1], ajuste$fitted.values, xlab="y", ylab="y.hat", main="y.hat vs y")
abline(0,1)

mean(ajuste$residuals^2)/var(data[,1])



# EXAMPLE 2: SIMULATED DATA
## Example 2a: independent data

set.seed(1234)
# We generate the data
n <- 100
t <- ((1:n)-0.5)/n
beta <- c(0.05, 0.01)
m <- function(t) {0.25*t*(1-t)}
f <- m(t)

x <- matrix(rnorm(200,0,1), nrow=n)
sum <- x%*%beta
epsilon <- rnorm(n, 0, 0.01)
y <-  sum + f + epsilon
data_ind <- matrix(c(y,x,t),nrow=100)

# We estimate the components of the PLR model
# (CV bandwidth)
a <- plrm.est(data_ind)

a$beta

est <- a$m.t
plot(t, est, type="l", lty=2, ylab="")
points(t, 0.25*t*(1-t), type="l")
legend(x="topleft", legend = c("m", "m hat"), col=c("black", "black"), lty=c(1,2))


## Example 2b: dependent data
# We generate the data
x <- matrix(rnorm(200,0,1), nrow=n)
sum <- x%*%beta
epsilon <- arima.sim(list(order = c(1,0,0), ar=0.7), sd = 0.01, n = n)
y <-  sum + f + epsilon
data_dep <- matrix(c(y,x,t),nrow=100)

# We estimate the components of the PLR model
# (CV bandwidth)
h <- plrm.cv(data_dep, ln.0=2)$bh.opt[3,1]
a <- plrm.est(data_dep, h=h)

a$beta

est <- a$m.t
plot(t, est, type="l", lty=2, ylab="")
points(t, 0.25*t*(1-t), type="l")
legend(x="topleft", legend = c("m", "m hat"), col=c("black", "black"), lty=c(1,2))




