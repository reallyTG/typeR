library(squash)


### Name: makecmap
### Title: Generate a color map from numeric values to colors
### Aliases: makecmap
### Keywords: color

### ** Examples

  attach(iris)
  map1 <- makecmap(Petal.Length)
  myColors <- cmap(Petal.Length, map = map1)
  plot(Sepal.Length, Sepal.Width, col = myColors, pch = 16)
  hkey(map1, title = 'Petal.Length')

  ## Compare the 'breaks' element in the following:
  x <- rnorm(100) * 1000
  str(makecmap(x))
  str(makecmap(x, breaks = c(-Inf, -1000, 0, 1000, Inf)))
  str(makecmap(x, breaks = prettyLog))





