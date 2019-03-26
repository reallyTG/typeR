library(opticut)


### Name: rankComb
### Title: Ranking Based Binary Partitions
### Aliases: rankComb oComb
### Keywords: manip misc

### ** Examples

## simulate some data
set.seed(1234)
n <- 200
x0 <- sample(1:4, n, TRUE)
x1 <- ifelse(x0 %in% 1:2, 1, 0)
x2 <- rnorm(n, 0.5, 1)
lam <- exp(0.5 + 0.5*x1 + -0.2*x2)
Y <- rpois(n, lam)

## binary partitions
head(rc <- rankComb(Y, model.matrix(~x2), as.factor(x0), dist="poisson"))
attr(rc, "est") # expected values in factor levels
aggregate(exp(0.5 + 0.5*x1), list(x0=x0), mean) # true values

## simple example
oComb(1:4, "+")
## using estimates
oComb(attr(rc, "est"))



