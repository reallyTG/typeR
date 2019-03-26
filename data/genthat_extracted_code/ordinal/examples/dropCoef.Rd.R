library(ordinal)


### Name: drop.coef
### Title: Ensure Full Rank Design Matrix
### Aliases: drop.coef
### Keywords: models

### ** Examples


X <- model.matrix( ~ PRODID * DAY, data = soup)
ncol(X)
newX <- drop.coef(X)
ncol(newX)

## Essentially this is being computed:
qr.X <- qr(X, tol = 1e-7, LAPACK = FALSE)
newX <- X[, qr.X$pivot[1:qr.X$rank], drop = FALSE]
## is newX of full column rank?
ncol(newX) == qr(newX)$rank
## the number of columns being dropped:
ncol(X) - ncol(newX)




