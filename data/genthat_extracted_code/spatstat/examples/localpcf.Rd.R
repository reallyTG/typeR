library(spatstat)


### Name: localpcf
### Title: Local pair correlation function
### Aliases: localpcf localpcfinhom
### Keywords: spatial nonparametric

### ** Examples

  data(ponderosa)
  X <- ponderosa

  g <- localpcf(X, stoyan=0.5)
  colo <- c(rep("grey", npoints(X)), "blue")
  a <- plot(g, main=c("local pair correlation functions", "Ponderosa pines"),
          legend=FALSE, col=colo, lty=1)

  # plot only the local pair correlation function for point number 7
  plot(g, est007 ~ r)

  gi <- localpcfinhom(X, stoyan=0.5)
  a <- plot(gi, main=c("inhomogeneous local pair correlation functions",
                       "Ponderosa pines"),
                legend=FALSE, col=colo, lty=1)



