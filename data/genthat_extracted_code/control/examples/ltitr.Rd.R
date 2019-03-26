library(control)


### Name: ltitr
### Title: Time response of a Linear Time-Invariant system
### Aliases: ltitr

### ** Examples


A <- diag(1, 2)
B <- rbind(1, 1)
x0 <- rbind(-1, -2)
u <- cbind(1, 2, 3, 4, 5)
X <- ltitr(A, B, u)
X <- ltitr(A, B, u, x0)

A <- replicate(6, abs(rnorm(6)))
B <- replicate(3, abs(rnorm(6)))
U <- replicate(100, rnorm(3))
x0 <-  rnorm(6)
X <- ltitr(A, B, U)
X <- ltitr(A, B, U, x0)




