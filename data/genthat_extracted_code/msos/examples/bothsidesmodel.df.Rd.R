library(msos)


### Name: bothsidesmodel.df
### Title: Obtain the degrees of freedom for a model.
### Aliases: bothsidesmodel.df

### ** Examples

#Find the DF for a likelihood ratio test statistic.
x <- cbind(1, c(-2, -1, 0, 1, 2), c(2, -1, -2, -1, 2),
              c(-1, 2, 0, -2, 1), c(1, -4, 6, -4, 1))
# or x <- cbind(1, poly(1:5, 4))
data(skulls)
x <- kronecker(x, rep(1, 30))
y <- skulls[, 1:4]
z <- diag(4)
pattern <- rbind(c(1, 1, 1, 1), 1, 0, 0, 0)
xx <- t(x) %*% x
bothsidesmodel.df(xx, nrow(y), pattern)



