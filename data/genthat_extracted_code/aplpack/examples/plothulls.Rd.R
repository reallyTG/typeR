library(aplpack)


### Name: plothulls
### Title: plothulls for data peeling
### Aliases: plothulls

### ** Examples

  # 10 hulls computed from the faithful data and plotted
  plothulls(faithful, n.hull=10, lty.hull=1)
  # plotting additionally a hull with 90 percent of points within the hull
  plot(faithful)
  plothulls(faithful, fraction=.90, add=TRUE, col.hull="red", lwd.hull=3)
  # hull with 10 percent of points within the hull 
  plothulls(faithful, fraction=.10, col.hull="red", lwd.hull=3)
  # first 3 hulls of the cars data set
  n <- 3
  plothulls(cars, n.hull=n, col.hull=1:n, lty.hull=1:n)
  # 5 hulls represented by colored regions
  n <- 5
  cols <- heat.colors(9)[3:(3+n-1)]
  plothulls(cars, n.hull=n, col.hull=cols, lty.hull=1:n, density=NA, col=0)
  points(cars, pch=17, cex=1)
  # 6 hulls: regions colored and boundaries shown
  n <- 6
  cols <- rainbow(n)
  plothulls(cars, n.hull=n, col.hull=cols, lty.hull=1:n, density=NA, col=0)
  plothulls(cars, n.hull=n, add=TRUE, col.hull=1, lwd.hull=2, lty=1, col=0)



