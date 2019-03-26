library(PLRModels)


### Name: np.ancova
### Title: Nonparametric analysis of covariance
### Aliases: np.ancova
### Keywords: Statistical Inference Regression Time Series Nonparametric
###   Statistics

### ** Examples

# EXAMPLE 1: REAL DATA
data <- matrix(10,120,2)
data(barnacles1)
barnacles1 <- as.matrix(barnacles1)
data[,1] <- barnacles1[,1]
data <- diff(data, 12)
data[,2] <- 1:nrow(data)

data2 <- matrix(10,120,2)
data(barnacles2)
barnacles2 <- as.matrix(barnacles2)
data2[,1] <- barnacles2[,1]
data2 <- diff(data2, 12)
data2[,2] <- 1:nrow(data2)

data3 <- matrix(0, nrow(data),ncol(data)+1)
data3[,1] <- data[,1]
data3[,2:3] <- data2

np.ancova(data=data3)



# EXAMPLE 2: SIMULATED DATA
## Example 2.1: dependent data: true null hypothesis

set.seed(1234)
# We generate the data
n <- 100
t <- ((1:n)-0.5)/n
m1 <- function(t) {0.25*t*(1-t)}
f <- m1(t)

epsilon1 <- arima.sim(list(order = c(1,0,0), ar=0.7), sd = 0.01, n = n)
y1 <-  f + epsilon1

epsilon2 <- arima.sim(list(order = c(0,0,1), ma=0.5), sd = 0.02, n = n)
y2 <- f + epsilon2

data_eq <- cbind(y1, y2, t)

# We apply the test
np.ancova(data_eq, time.series=TRUE)


## Example 2.2: dependent data: false null hypothesis
# We generate the data
n <- 100
t <- ((1:n)-0.5)/n
m3 <- function(t) {0.25*t*(1-t)}
m4 <- function(t) {0.25*t*(1-t)*0.75}

f3 <- m3(t)
epsilon3 <- arima.sim(list(order = c(1,0,0), ar=0.7), sd = 0.01, n = n)
y3 <-  f3 + epsilon3

f4 <- m4(t)
epsilon4 <- arima.sim(list(order = c(0,0,1), ma=0.5), sd = 0.02, n = n)
y4 <-  f4 + epsilon4

data_neq<- cbind(y3, y4, t)

# We apply the test
np.ancova(data_neq, time.series=TRUE)




