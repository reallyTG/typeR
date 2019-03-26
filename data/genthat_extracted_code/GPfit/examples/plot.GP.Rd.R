library(GPfit)


### Name: plot.GP
### Title: Plotting GP model fits
### Aliases: plot.GP

### ** Examples


## 1D Example 1
n <- 5
d <- 1 
computer_simulator <- function(x){
    x <- 2 * x + 0.5
    y <- sin(10 * pi * x) / (2 * x) + (x - 1)^4
    return(y)
}
set.seed(3)
library(lhs)
x <- maximinLHS(n,d)
y <- computer_simulator(x)
GPmodel <- GP_fit(x,y)
plot(GPmodel)


## 1D Example 2
n <- 7
d <- 1
computer_simulator <- function(x) {
    y <- log(x + 0.1) + sin(5 * pi * x)
    return(y)
}
set.seed(1)
library(lhs)
x <- maximinLHS(n,d)
y <- computer_simulator(x)
GPmodel <- GP_fit(x, y)
## Plotting with changes from the default line type and characters
plot(GPmodel, resolution = 100, line_type = c(6,2), pch = 5)


## 2D Example: GoldPrice Function
computer_simulator <- function(x) {
    x1 <- 4 * x[, 1] - 2
    x2 <- 4 * x[, 2] - 2
    t1 <- 1 + (x1 + x2 + 1)^2 * (19 - 14 * x1 + 3 * x1^2 - 14 * x2 + 
        6 * x1 * x2 + 3 * x2^2)
    t2 <- 30 + (2 * x1 - 3 * x2)^2 * (18 - 32 * x1 + 12 * x1^2 + 48 * x2 - 
        36 * x1 * x2 + 27 * x2^2)
    y <- t1 * t2
    return(y)
}
n <- 30 
d <- 2
set.seed(1)
x <- lhs::maximinLHS(n, d) 
y <- computer_simulator(x)
GPmodel <- GP_fit(x, y)
## Basic level plot
plot(GPmodel)
## Adding Contours and increasing the number of levels
plot(GPmodel, contour = TRUE, cuts = 50, pretty = TRUE)
## Plotting the Response Surface
plot(GPmodel, surf_check = TRUE)
## Plotting the Error Surface with color
plot(GPmodel, surf_check = TRUE, response = FALSE, shade = TRUE)




