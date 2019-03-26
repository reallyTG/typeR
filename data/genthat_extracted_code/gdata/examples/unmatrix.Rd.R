library(gdata)


### Name: unmatrix
### Title: Convert a matrix into a vector, with appropriate names
### Aliases: unmatrix
### Keywords: manip

### ** Examples

# simple, useless example
m <- matrix( letters[1:10], ncol=5)
m
unmatrix(m)

# unroll model output
x <- rnorm(100)
y <- rnorm(100, mean=3+5*x, sd=0.25)
m <- coef( summary(lm( y ~ x )) )
unmatrix(m)



