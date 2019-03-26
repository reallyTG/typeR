library(PLRModels)


### Name: par.ci
### Title: Confidence intervals estimation in linear regression models
### Aliases: par.ci
### Keywords: Statistical Inference Regression Time Series

### ** Examples

# EXAMPLE 1: REAL DATA
data(barnacles1)
data <- as.matrix(barnacles1)
data <- diff(data, 12)
data <- cbind(data[,1],1,data[,-1])

## Not run: par.ci(data, a=c(1,0,0), CI="all")
## Not run: par.ci(data, a=c(0,1,0), CI="all")
## Not run: par.ci(data, a=c(0,0,1), CI="all")



# EXAMPLE 2: SIMULATED DATA
## Example 2a: dependent data

set.seed(123)
# We generate the data
n <- 100
beta <- c(0.5, 2)

x <- matrix(rnorm(200,0,3), nrow=n)
sum <- x%*%beta
sum <- as.matrix(sum)
eps <- arima.sim(list(order = c(1,0,0), ar=0.7), sd = 0.1, n = n)
eps <- as.matrix(eps)
y <-  sum + eps
data_parci <- cbind(y,x)

# We estimate the confidence interval of a^T * beta in the PLR model
## Not run: par.ci(data, a=c(1,0), CI="all")
## Not run: par.ci(data, a=c(0,1), CI="all")




