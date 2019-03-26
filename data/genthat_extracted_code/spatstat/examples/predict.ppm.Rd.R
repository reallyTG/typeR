library(spatstat)


### Name: predict.ppm
### Title: Prediction from a Fitted Point Process Model
### Aliases: predict.ppm
### Keywords: spatial models

### ** Examples

  ## Don't show: 
op <- spatstat.options(npixel=32)
## End(Don't show)
  m <- ppm(cells ~ polynom(x,y,2), Strauss(0.05))
  trend <- predict(m, type="trend")
  ## Not run: 
##D   image(trend)
##D   points(cells)
##D   
## End(Not run)
  cif <- predict(m, type="cif")
  ## Not run: 
##D   persp(cif)
##D   
## End(Not run)
  mj <- ppm(japanesepines ~ harmonic(x,y,2))
  se <- predict(mj, se=TRUE) # image of standard error
  ci <- predict(mj, interval="c") # two images, confidence interval

  # prediction interval for total number of points
  predict(mj, type="count", interval="p")

  # prediction intervals for counts in tiles
  predict(mj, window=quadrats(japanesepines, 3), type="count", interval="p")

  # prediction at arbitrary locations
  predict(mj, locations=data.frame(x=0.3, y=0.4))

  X <- runifpoint(5, Window(japanesepines))
  predict(mj, locations=X, se=TRUE)

  # multitype
  rr <- matrix(0.06, 2, 2)
  ma <- ppm(amacrine ~ marks,  MultiStrauss(rr))
  Z <- predict(ma)
  Z <- predict(ma, type="cif")
  predict(ma, locations=data.frame(x=0.8, y=0.5,marks="on"), type="cif")

  ## Don't show: 
spatstat.options(op)
## End(Don't show)



