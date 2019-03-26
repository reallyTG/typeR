library(ncf)


### Name: mantel.correlog
### Title: Mantel (cross-)correlograms
### Aliases: mantel.correlog
### Keywords: spatial

### ** Examples

# first generate some sample data
x <- expand.grid(1:20, 1:5)[, 1]
y <- expand.grid(1:20, 1:5)[, 2]

# z data from an exponential random field
z <- cbind(
  rmvn.spa(x = x, y = y, p = 2, method = "exp"), 
  rmvn.spa(x = x, y = y, p = 2, method = "exp")
  )

# w data from a gaussian random field
w <- cbind(rmvn.spa(
  x = x, y = y, p = 2, method = "gaus"), 
  rmvn.spa(x = x, y = y, p = 2, method = "gaus")
  )

# Make distance and similarity matrices
zmat <- cor(t(z))
wmat <- cor(t(w))
dmat <- sqrt(outer(x, x, "-")^2 + outer(y, y, "-")^2)

# Mantel correlogram 
fit1 <- mantel.correlog(dmat = dmat, zmat = zmat, increment = 2, quiet = TRUE, 
                        resamp = 0)
## Not run: plot(fit1)

# Mantel cross-correlogram 
fit2 <- mantel.correlog(dmat = dmat, zmat = zmat, wmat = wmat, increment = 2, 
                        quiet = TRUE, resamp = 0)
## Not run: plot(fit2)



