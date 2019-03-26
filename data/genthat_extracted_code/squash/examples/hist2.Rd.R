library(squash)


### Name: hist2
### Title: Bivariate histogram
### Aliases: hist2
### Keywords: hplot

### ** Examples

  set.seed(123)
  x <- rnorm(10000)
  y <- rnorm(10000) + x
  hist2(x, y)
  
  ## pseudo-log-scale color breaks:
  hist2(x, y, breaks = prettyLog, key.args = list(stretch = 4))

  ## log-scale color breaks; the old way using 'base'
  ## (notice box removal to make space for the vertical color key)
  hist2(x, y, base = 2, key = vkey, nz = 5, bty = 'l')




