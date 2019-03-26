library(MESS)


### Name: screen_variables
### Title: Screen variable before penalized regression
### Aliases: screen_variables
### Keywords: manip

### ** Examples


x <- matrix(rnorm(50*100), nrow=50)
y <- rnorm(50, mean=x[,1])
screen_variables(x, y, lambda=c(.1, 1, 2))




