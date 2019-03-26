library(psych)


### Name: matrix.addition
### Title: A function to add two vectors or matrices
### Aliases: matrix.addition %+%
### Keywords: multivariate

### ** Examples


x <- seq(1,4)
z <- x %+% -t(x)
x
z
#compare with outer(x,-x,FUN="+")
x <- matrix(seq(1,6),ncol=2)
y <- matrix(seq(1,10),nrow=2)
z <- x %+% y
x
y
z
#but compare this with outer(x ,y,FUN="+") 



