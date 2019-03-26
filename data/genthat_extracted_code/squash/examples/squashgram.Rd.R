library(squash)


### Name: squashgram
### Title: Visualize a function of z coordinates, binned by x, y
###   coordinates
### Aliases: squashgram
### Keywords: hplot

### ** Examples

  ## earthquake depths in Fiji
  attach(quakes)
  squashgram(depth ~ long + lat, FUN = mean)

  ## iris measurements 
  attach(iris)
  squashgram(Sepal.Length, Sepal.Width, Petal.Length, 
    FUN = median, nx = 20, ny = 15)

  ## Here indicate sample size by size of rectangles
  squashgram(iris[,1:3], FUN = median, 
    nx = 20, ny = 15, shrink = 5)

  ## What is the trend in my noisy 3-dimensional data?
  set.seed(123)
  x <- rnorm(10000)
  y <- rnorm(10000)
  z <- rnorm(10000) + cos(x) + abs(y / 4)
  squashgram(x, y, z, median, colFn = bluered, shrink = 5)




