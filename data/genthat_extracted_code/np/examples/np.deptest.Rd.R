library(np)


### Name: npdeptest
### Title: Kernel Consistent Pairwise Nonlinear Dependence Test for
###   Univariate Processes
### Aliases: npdeptest
### Keywords: univar nonparametric

### ** Examples

## Not run: 
##D set.seed(1234)
##D 
##D ## Test/measure lack of fit between y and its fitted value from a
##D ## regression model when x is relevant using the `summation' version.
##D 
##D n <- 100
##D x <- rnorm(n)
##D y <- 1 + x + rnorm(n)
##D model <- lm(y~x)
##D y.fit <- fitted(model)
##D 
##D npdeptest(y,y.fit,boot.num=99,method="summation")
##D 
##D Sys.sleep(5)
##D 
##D ## Test/measure lack of fit between y and its fitted value from a
##D ## regression model when x is irrelevant using the `summation' version.
##D 
##D n <- 100
##D x <- runif(n,-2,2)
##D y <- 1 + rnorm(n)
##D model <- lm(y~x)
##D y.fit <- fitted(model)
##D 
##D npdeptest(y,y.fit,boot.num=99,method="summation")
##D 
##D ## Test/measure lack of fit between y and its fitted value from a
##D ## regression model when x is relevant using the `integration'
##D ## version (default, slower than summation version).
##D 
##D n <- 100
##D x <- rnorm(n)
##D y <- 1 + x + rnorm(n)
##D model <- lm(y~x)
##D y.fit <- fitted(model)
##D 
##D npdeptest(y,y.fit,boot.num=99)
##D 
##D Sys.sleep(5)
##D 
##D ## Test/measure lack of fit between y and its fitted value from a
##D ## regression model when x is irrelevant using the `integration'
##D ## version (default, slower than summation version).
##D 
##D n <- 100
##D x <- runif(n,-2,2)
##D y <- 1 + rnorm(n)
##D model <- lm(y~x)
##D y.fit <- fitted(model)
##D 
##D npdeptest(y,y.fit,boot.num=99)
## End(Not run) 



