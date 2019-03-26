library(PLRModels)


### Name: par.ancova
### Title: Parametric analysis of covariance (based on linear models)
### Aliases: par.ancova
### Keywords: Statistical Inference Regression Time Series

### ** Examples

# EXAMPLE 1: REAL DATA
data(barnacles1)
data <- as.matrix(barnacles1)
data <- diff(data, 12)
data <- cbind(data[,1],1,data[,-1])

data(barnacles2)
data2 <- as.matrix(barnacles2)
data2 <- diff(data2, 12)
data2 <- cbind(data2[,1],1,data2[,-1])

data3 <- array(0, c(nrow(data),ncol(data),2))
data3[,,1] <- data
data3[,,2] <- data2

par.ancova(data=data3)



# EXAMPLE 2: SIMULATED DATA
## Example 2a: dependent data - true null hypothesis

set.seed(1234)
# We generate the data
n <- 100
t <- ((1:n)-0.5)/n
beta <- c(0.05, 0.01)

x1 <- matrix(rnorm(200,0,1), nrow=n)
sum1 <- x1%*%beta
epsilon1 <- arima.sim(list(order = c(1,0,0), ar=0.7), sd = 0.01, n = n)
y1 <-  sum1 + epsilon1
data1 <- cbind(y1,x1)

x2 <- matrix(rnorm(200,1,2), nrow=n)
sum2 <- x2%*%beta
epsilon2 <- arima.sim(list(order = c(0,0,1), ma=0.5), sd = 0.02, n = n)
y2 <- sum2 + epsilon2
data2 <- cbind(y2,x2)

data_eq <- array(cbind(data1,data2),c(100,3,2))

# We apply the test
par.ancova(data_eq, time.series=TRUE)


## Example 2a: dependent data - false null hypothesis
# We generate the data
n <- 100
beta3 <- c(0.05, 0.01)
beta4 <- c(0.05, 0.02)

x3 <- matrix(rnorm(200,0,1), nrow=n)
sum3 <- x3%*%beta3
epsilon3 <- arima.sim(list(order = c(1,0,0), ar=0.7), sd = 0.01, n = n)
y3 <-  sum3 + epsilon3
data3 <- cbind(y3,x3)

x4 <- matrix(rnorm(200,1,2), nrow=n)
sum4 <- x4%*%beta4
epsilon4 <- arima.sim(list(order = c(0,0,1), ma=0.5), sd = 0.02, n = n)
y4 <-  sum4 + epsilon4
data4 <- cbind(y4,x4)

data_neq <- array(cbind(data3,data4),c(100,3,2))

# We apply the test
par.ancova(data_neq, time.series=TRUE) 




