library(PLRModels)


### Name: plrm.ci
### Title: Confidence intervals estimation in partial linear regression
###   models
### Aliases: plrm.ci
### Keywords: Statistical Inference Regression Time Series

### ** Examples

# EXAMPLE 1: REAL DATA
data(barnacles1)
data <- as.matrix(barnacles1)
data <- diff(data, 12)
data <- cbind(data,1:nrow(data))

b.h <- plrm.gcv(data)$bh.opt
b1 <- b.h[1]

## Not run: plrm.ci(data, b1=b1, b2=b1, a=c(1,0), CI="all")
## Not run: plrm.ci(data, b1=b1, b2=b1, a=c(0,1), CI="all")



# EXAMPLE 2: SIMULATED DATA
## Example 2a: dependent data

set.seed(123)
# We generate the data
n <- 100
t <- ((1:n)-0.5)/n
m <- function(t) {t+0.5}
f <- m(t)

beta <- c(0.5, 2)
x <- matrix(rnorm(200,0,3), nrow=n)
sum <- x%*%beta
sum <- as.matrix(sum)
eps <- arima.sim(list(order = c(1,0,0), ar=0.7), sd = 0.1, n = n)
eps <- as.matrix(eps)

y <-  sum + f + eps
data_plrmci <- cbind(y,x,t)

## Not run: plrm.ci(data, a=c(1,0), CI="all")
## Not run: plrm.ci(data, a=c(0,1), CI="all")



