library(DiscreteWeibull)


### Name: Discrete Weibull (Type 1)
### Title: The type 1 discrete Weibull distribution
### Aliases: ddweibull pdweibull qdweibull rdweibull
### Keywords: distribution

### ** Examples

# Ex.1
x <- 1:10
q <- 0.6
beta <- 0.8
ddweibull(x, q, beta)
t <- qdweibull(0.99, q, beta)
t
pdweibull(t, q, beta)
# 
x <- 0:10
ddweibull(x, q, beta, zero=TRUE)
t <- qdweibull(0.99, q, beta, zero=TRUE)
t
pdweibull(t, q, beta, zero=TRUE)

# Ex.2
q <- 0.4
beta <- 0.7
n <- 100
x <- rdweibull(n, q, beta)
tabulate(x)/sum(tabulate(x))
y <- 1:round(max(x))
# compare with
ddweibull(y, q, beta)



