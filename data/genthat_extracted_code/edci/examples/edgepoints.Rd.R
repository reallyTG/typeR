library(edci)


### Name: edgepoints
### Title: Edge detection in noisy images
### Aliases: edgepoints
### Keywords: robust multivariate nonparametric

### ** Examples

  ## produce a matrix representation of a simple
  ## noisy image showing a black rectangle
  y = matrix(rep(0, 60 * 60), nrow = 60)
  y[21:40, 21:40] = 1
  y = y + matrix(rnorm(60 * 60, 0, 0.2), nrow = 60)
  image(y, col = gray(seq(0, 1, 1/255)))

  ## find the rectangle's edge points
  ye = edgepoints(y, 0.05, 0.05, estimator = "M_median", kernel = "gauss")
  image(ye[[1]] > 0.7, col = gray(c(1,0)))



