library(PLRModels)


### Name: np.gof
### Title: Goodness-of-Fit tests in nonparametric regression models
### Aliases: np.gof
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

np.gof(data)



# EXAMPLE 2: SIMULATED DATA
## Example 2a: dependent data

set.seed(1234)
# We generate the data
n <- 100
t <- ((1:n)-0.5)/n
m <- function(t) {0.25*t*(1-t)}
f <- m(t)
f.function <- function(u) {0.25*u*(1-u)}

epsilon <- arima.sim(list(order = c(1,0,0), ar=0.7), sd = 0.01, n = n)
y <-  f + epsilon
data <- cbind(y,t)

## Example 2a.1: true null hypothesis
np.gof(data, m0=f.function, time.series=TRUE)

## Example 2a.2: false null hypothesis
np.gof(data, time.series=TRUE) 




