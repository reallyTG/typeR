library(GPfit)


### Name: predict
### Title: Model Predictions from GPfit
### Aliases: predict predict.GP fitted.GP
### Keywords: Gaussian Model Prediction Process

### ** Examples


## 1D Example
n <- 5
d <- 1
computer_simulator <- function(x){
    x <- 2*x+0.5
    sin(10*pi*x)/(2*x) + (x-1)^4
}
set.seed(3)
library(lhs)
x <- maximinLHS(n,d)
y <- computer_simulator(x)
xvec <- seq(from = 0, to = 1, length.out = 10)
GPmodel <- GP_fit(x, y)
head(fitted(GPmodel))
lapply(predict(GPmodel, xvec), head)


## 1D Example 2
n <- 7
d <- 1
computer_simulator <- function(x) {
    log(x+0.1)+sin(5*pi*x)
}
set.seed(1)
library(lhs)
x <- maximinLHS(n,d)
y <- computer_simulator(x)
xvec <- seq(from = 0,to = 1, length.out = 10)
GPmodel <- GP_fit(x, y)
head(fitted(GPmodel))
predict(GPmodel, xvec)

## 2D Example: GoldPrice Function
computer_simulator <- function(x) {
    x1 <- 4*x[,1] - 2
    x2 <- 4*x[,2] - 2
    t1 <- 1 + (x1 + x2 + 1)^2*(19 - 14*x1 + 3*x1^2 - 14*x2 + 
        6*x1*x2 + 3*x2^2)
    t2 <- 30 + (2*x1 -3*x2)^2*(18 - 32*x1 + 12*x1^2 + 48*x2 - 
        36*x1*x2 + 27*x2^2)
    y <- t1*t2
    return(y)
}
n <- 10
d <- 2
set.seed(1)
library(lhs)
x <- maximinLHS(n,d) 
y <- computer_simulator(x)
GPmodel <- GP_fit(x,y)
# fitted values
head(fitted(GPmodel))
# new data
xvector <- seq(from = 0,to = 1, length.out = 10)
xdf <- expand.grid(x = xvector, y = xvector)
predict(GPmodel, xdf)



