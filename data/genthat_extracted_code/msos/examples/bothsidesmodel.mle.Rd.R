library(msos)


### Name: bothsidesmodel.mle
### Title: Calculate the maximum likelihood estimates
### Aliases: bothsidesmodel.mle

### ** Examples

data(mouths)
x <- cbind(1, mouths[, 5])
y <- mouths[, 1:4]
z <- cbind(1, c(-3, -1, 1, 3), c(-1, 1, 1, -1), c(-1, 3, -3, 1))
bothsidesmodel.mle(x, y, z, cbind(c(1, 1), 1, 0, 0))



