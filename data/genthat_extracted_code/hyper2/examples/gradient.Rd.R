library(hyper2)


### Name: gradient
### Title: Differential calculus
### Aliases: gradient

### ** Examples


data(chess)
p <- c(1/2,1/3)
delta <- rnorm(2)/1e5  # delta needs to be quite small

deltaL  <- loglik(chess,p+delta) - loglik(chess,p)
deltaLn <- sum(delta*gradient(chess,p + delta/2))   # numeric

deltaL - deltaLn  # should be small




