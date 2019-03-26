library(PLRModels)


### Name: par.gof
### Title: Goodness-of-Fit tests in linear regression models
### Aliases: par.gof
### Keywords: Statistical Inference Regression Time Series

### ** Examples

# EXAMPLE 1: REAL DATA
data(barnacles1)
data <- as.matrix(barnacles1)
data <- diff(data, 12)
data <- cbind(data[,1],1,data[,-1])

## Example 1.1: false null hypothesis
par.gof(data)
## Example 1.2: true null hypothesis
par.gof(data, beta0=c(0,0.15,0.4))



# EXAMPLE 2: SIMULATED DATA
## Example 2a: dependent data

set.seed(1234)
# We generate the data
n <- 100
beta <- c(0.05, 0.01)

x <- matrix(rnorm(200,0,1), nrow=n)
sum <- x%*%beta
epsilon <- arima.sim(list(order = c(1,0,0), ar=0.7), sd = 0.01, n = n)
y <-  sum + epsilon
data <- cbind(y,x)

## Example 2a.1: true null hypothesis
par.gof(data, beta0=c(0.05, 0.01))

## Example 2a.2: false null hypothesis
par.gof(data) 




