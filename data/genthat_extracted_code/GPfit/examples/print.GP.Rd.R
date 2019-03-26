library(GPfit)


### Name: print.GP
### Title: GP model fit Summary
### Aliases: print.GP

### ** Examples


## 1D example
n <- 5
d <- 1 
computer_simulator <- function(x){
    x <- 2 * x + 0.5
    y <- sin(10 * pi * x) / (2 * x) + (x - 1)^4
    return(y)
}
set.seed(3)
x <- lhs::maximinLHS(n, d)
y <- computer_simulator(x)
GPmodel <- GP_fit(x, y)
print(GPmodel)


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
n <- 30 
d <- 2
set.seed(1)
x <- lhs::maximinLHS(n, d) 
y <- computer_simulator(x)
GPmodel <- GP_fit(x,y)
print(GPmodel, digits = 3)




