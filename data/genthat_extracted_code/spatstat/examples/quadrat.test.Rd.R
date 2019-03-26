library(spatstat)


### Name: quadrat.test
### Title: Dispersion Test for Spatial Point Pattern Based on Quadrat
###   Counts
### Aliases: quadrat.test quadrat.test.ppp quadrat.test.ppm
###   quadrat.test.quadratcount
### Keywords: spatial htest

### ** Examples

  data(simdat)
  quadrat.test(simdat)
  quadrat.test(simdat, 4, 3)

  quadrat.test(simdat, alternative="regular")
  quadrat.test(simdat, alternative="clustered")

  # Using Monte Carlo p-values
  quadrat.test(swedishpines) # Get warning, small expected values.
  ## Not run: 
##D     quadrat.test(swedishpines, method="M", nsim=4999)
##D     quadrat.test(swedishpines, method="M", nsim=4999, conditional=FALSE)
##D   
## End(Not run)
  ## Don't show: 
    quadrat.test(swedishpines, method="M", nsim=19)
    quadrat.test(swedishpines, method="M", nsim=19, conditional=FALSE)
  
## End(Don't show)

  # quadrat counts
  qS <- quadratcount(simdat, 4, 3)
  quadrat.test(qS)

  # fitted model: inhomogeneous Poisson
  fitx <- ppm(simdat, ~x, Poisson())
  quadrat.test(fitx)

  te <- quadrat.test(simdat, 4)
  residuals(te)  # Pearson residuals

  plot(te)

  plot(simdat, pch="+", cols="green", lwd=2)
  plot(te, add=TRUE, col="red", cex=1.4, lty=2, lwd=3)

  sublab <- eval(substitute(expression(p[chi^2]==z),
                       list(z=signif(te$p.value,3))))
  title(sub=sublab, cex.sub=3)

  # quadrats of irregular shape
  B <- dirichlet(runifpoint(6, Window(simdat)))
  qB <- quadrat.test(simdat, tess=B)
  plot(simdat, main="quadrat.test(simdat, tess=B)", pch="+")
  plot(qB, add=TRUE, col="red", lwd=2, cex=1.2)




