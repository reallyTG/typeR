library(edci)


### Name: edgecluster
### Title: Edge detection in noisy images
### Aliases: edgecluster
### Keywords: robust multivariate nonparametric

### ** Examples

  # generate a 60x60 zero matrix
  y = matrix(rep(0, 60 * 60), nrow = 60)
  # set a square-shaped set of elements to 1
  y[21:40, 21:40] = 1
  # add some noise
  y = y + matrix(rnorm(60 * 60, 0, 0.2), nrow = 60)
  # plot it
  image(y, col = gray(seq(0, 1, 1/255)))

  # find edge points of the square-shaped object 
  ec = edgecluster(y, 0.05, 0.05, 0.7,
    estimator = "M_median", kernel = "gauss")
  plot(bestMclust(ec[[1]], 4), ec[[2]], xlim = c(0, 1), ylim = c(0, 1))



