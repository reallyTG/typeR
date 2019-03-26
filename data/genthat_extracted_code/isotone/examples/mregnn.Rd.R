library(isotone)


### Name: mregnn
### Title: Regression with Linear Inequality Restrictions on Predicted
###   Values
### Aliases: mregnn mregnnM mregnnP
### Keywords: models

### ** Examples

## Compute the best fitting quadratic polynomial (in black) 
## and monotone quadratic polynomial (in blue)
set.seed(12345)
x <- outer(1:10,1:3,"^")
x <- apply(x,2,function(x)
x - mean(x))
x <- apply (x,2,function(x)
x / sqrt (sum(x ^ 2)))
y <- rowSums(x) + rnorm(10)
plot(x[,1], y, lwd = 3, col = "RED", xlab = "x", ylab = "P(x)")
o <- mregnnM(x,y)
lines(x[,1], o$xb, col = "BLUE", lwd = 2)
xb <- drop(x %*% qr.solve(x,y))
lines(x[,1],xb,col="BLACK", lwd = 2)

## same monotone model through basic mregnn()
difmat <- function (n) {
  m1 <- ifelse(outer(1:(n - 1),1:n,"-") == -1, 1, 0)
  m2 <- ifelse(outer(1:(n - 1),1:n,"-") == 0,-1, 0)
  return (m1 + m2)
}
a <- difmat(nrow(x))      ## order restriction
o2 <- mregnn(x, y, a)



