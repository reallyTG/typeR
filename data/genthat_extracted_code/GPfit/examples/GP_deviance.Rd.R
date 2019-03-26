library(GPfit)


### Name: GP_deviance
### Title: Computes the Deviance of a GP model
### Aliases: GP_deviance
### Keywords: Deviance

### ** Examples


## 1D Example 1
n = 5
d = 1
computer_simulator <- function(x) {
    x = 2 * x + 0.5
    y = sin(10 * pi * x)/(2 * x) + (x - 1)^4
    return(y)
}
set.seed(3)
library(lhs)
x = maximinLHS(n,d)
y = computer_simulator(x)
beta =  rnorm(1)
GP_deviance(beta,x,y)


## 1D Example 2
n = 7
d = 1
computer_simulator <- function(x) {
    y <- log(x + 0.1) + sin(5 * pi * x)
    return(y)
}
set.seed(1)
library(lhs)
x = maximinLHS(n, d)
y = computer_simulator(x)
beta = rnorm(1)
GP_deviance(beta, x, y,
    corr = list(type = "matern", nu = 5/2))

## 2D Example: GoldPrice Function
computer_simulator <- function(x) {
    x1 = 4 * x[, 1] - 2
    x2 = 4 * x[, 2] - 2
    t1 = 1 + (x1 + x2 + 1)^2 * 
        (19 - 14 * x1 + 3 * x1^2 - 
        14 * x2 + 6 * x1 * x2 + 3 * x2^2)
    t2 = 30 + (2 * x1 - 3 * x2)^2 * 
        (18 - 32 * x1 + 12 * x1^2 + 
        48 * x2 - 36 * x1 * x2 + 27 * x2^2)
    y = t1 * t2
    return(y)
}
n = 10
d = 2
set.seed(1)
library(lhs)
x = maximinLHS(n, d) 
y = computer_simulator(x)
beta = rnorm(2)
GP_deviance(beta, x, y)




