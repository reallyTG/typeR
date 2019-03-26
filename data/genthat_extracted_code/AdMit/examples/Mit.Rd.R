library(AdMit)


### Name: Mit
### Title: Mixture of Student-t Distributions
### Aliases: dMit rMit
### Keywords: distribution

### ** Examples

  ## NB : Low number of draws for speedup. Consider using more draws!
  ## One dimensional two components mixture of Student-t distributions
  mit <- list(p = c(0.5, 0.5),
              mu = matrix(c(-2.0, 0.5), 2, 1, byrow = TRUE),
              Sigma = matrix(0.1, 2),
              df = 10)
  ## Generate draws from the mixture
  hist(rMit(1e4, mit = mit), nclass = 100, freq = FALSE)
  x <- seq(from = -5.0, to = 5.0, by = 0.01)
  ## Add the density to the histogram
  lines(x, dMit(x, mit = mit, log = FALSE), col = "red", lwd = 2)

  ## Two dimensional (one component mixture) Student-t distribution
  mit <- list(p = 1,
              mu = matrix(0.0, 1.0, 2.0),
              Sigma = matrix(c(1.0, 0.0, 0.0, 1.0), 1, 4),
              df = 10)
  ## Function used to plot the mixture in two dimensions
  dMitPlot <- function(x1, x2, mit = mit)
  {
    dMit(cbind(x1, x2), mit = mit, log = FALSE)
  }
  x1 <- x2 <- seq(from = -10.0, to = 10.0, by = 0.1)
  thexlim <- theylim <- range(x1)
  z <- outer(x1, x2, FUN = dMitPlot, mit = mit)
  ## Contour plot of the mixture
  contour(x1, x2, z, nlevel = 20, las = 1, 
          col = rainbow(20),
          xlim = thexlim, ylim = theylim)
  par(new = TRUE)
  ## Generate draws from the mixture
  plot(rMit(1e4, mit = mit), pch = 20, cex = 0.3, 
            xlim = thexlim, ylim = theylim, col = "red", las = 1)




