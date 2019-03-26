library(control)


### Name: care
### Title: Continuous-time Algebraic Riccati Equation solution
### Aliases: care

### ** Examples

a <- matrix(c(-3, 2,1, 1), byrow = TRUE, ncol = 2)
b <- matrix(c(0, 1), nrow = 2)
c <- matrix(c(1, -1), ncol = 2)
q <- t(c)%*%c
r <- 3
care(a, b, q, r)



