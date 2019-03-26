library(PLRModels)


### Name: par.est
### Title: Estimation in linear regression models
### Aliases: par.est
### Keywords: Statistical Inference Regression Time Series

### ** Examples

# EXAMPLE 1: REAL DATA
data(barnacles1)
data <- as.matrix(barnacles1)
data <- diff(data, 12)
data <- cbind(data[,1],1,data[,-1])

beta <- par.est(data=data)
beta
residuos <- data[,1] - data[,-1]%*%beta
mean(residuos^2)/var(data[,1])

fitted.values <- data[,-1]%*%beta
plot(data[,1], fitted.values, xlab="y", ylab="y.hat", main="y.hat vs y")
abline(0,1)



# EXAMPLE 2: SIMULATED DATA
## Example 2a: independent data

set.seed(1234)
# We generate the data
n <- 100
beta <- c(0.05, 0.01)

x <- matrix(rnorm(200,0,1), nrow=n)
sum <- x%*%beta
epsilon <- rnorm(n, 0, 0.01)
y <-  sum + epsilon
data_ind <- matrix(c(y,x),nrow=100)

# We estimate the parametric component of the PLR model
par.est(data_ind)


## Example 2b: dependent data

set.seed(1234)
# We generate the data
x <- matrix(rnorm(200,0,1), nrow=n)
sum <- x%*%beta
epsilon <- arima.sim(list(order = c(1,0,0), ar=0.7), sd = 0.01, n = n)
y <-  sum + epsilon
data_dep <- matrix(c(y,x),nrow=100)

# We estimate the parametric component of the PLR model
par.est(data_dep)




