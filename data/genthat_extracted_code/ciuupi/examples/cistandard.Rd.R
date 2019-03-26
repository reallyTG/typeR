library(ciuupi)


### Name: cistandard
### Title: Compute the standard confidence interval
### Aliases: cistandard

### ** Examples

y <- c(87.2, 88.4, 86.7, 89.2)
x1 <- c(-1, 1, -1, 1)
x2 <- c(-1, -1, 1, 1)
x <- cbind(rep(1, 4), x1, x2, x1*x2)
a <- c(0, 2, 0, -2)

# Calculate the standard 95% confidence interval when sigma = 0.8
res <- cistandard(a, x, y, 0.05, sig = 0.8)
res




