library(ade4)


### Name: s.match
### Title: Plot of Paired Coordinates
### Aliases: s.match
### Keywords: multivariate hplot

### ** Examples

if(!adegraphicsLoaded()) {
  X <- data.frame(x = runif(50, -1, 2), y = runif(50, -1, 2))
  Y <- X + rnorm(100, sd = 0.3)
  par(mfrow = c(2, 2))
  s.match(X, Y)
  s.match(X, Y, edge = FALSE, clab = 0)
  s.match(X, Y, edge = FALSE, clab = 0)
  s.label(X, clab = 1, add.plot = TRUE)
  s.label(Y, clab = 0.75, add.plot = TRUE)
  s.match(Y, X, clab = 0)
  par(mfrow = c(1, 1))
}


