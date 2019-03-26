library(GPfit)


### Name: corr_matrix
### Title: Power Exponential or Matern Correlation Matrix
### Aliases: corr_matrix
### Keywords: Correlation Exponential Gaussian Matern Power

### ** Examples

## 1D Example - 1
n = 5
d = 1
set.seed(3)
library(lhs)
x = maximinLHS(n,d)
beta =  rnorm(1)
corr_matrix(x,beta)

## 1D Example - 2
beta = rnorm(1)
corr_matrix(x,beta,corr = list(type = "matern"))

## 2D example - 1
n = 10
d = 2
set.seed(2)
library(lhs)
x = maximinLHS(n,d) 
beta = rnorm(2)
corr_matrix(x, beta,
    corr = list(type = "exponential", power = 2))

## 2D example - 2
beta = rnorm(2)
R = corr_matrix(x,beta,corr = list(type = "matern", nu = 5/2))
print(R)




