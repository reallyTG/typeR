library(ecdfHT)


### Name: ecdfHT.draw
### Title: Graph and annotate an ecdfHT plot
### Aliases: ecdfHT.axes ecdfHT.draw ecdfHT.g ecdfHT.h

### ** Examples

set.seed(1)
x <- rcauchy( 1000 )
t.info <- ecdfHT( x, show.axes=FALSE )
ecdfHT.axes( t.info, x.labels=c(-50,-5,0,5,50), y.labels=c(.001,.01,.1,.5,.9,.99,.999),
  show.vert.gridlines=TRUE, show.horiz.gridline=TRUE, lty=2 )
q1 <- qcauchy(t.info$ecdf) # Cauchy quantiles
ecdfHT.draw( t.info, q1, t.info$ecdf, col='red',show.ci=TRUE)
q2 <- qnorm(t.info$ecdf,sd=sd(x))  # Gaussian quantiles
ecdfHT.draw( t.info, q2, t.info$ecdf, col='green',show.ci=TRUE)
title(paste("simulated Cauchy data, n=",length(x),"\nred=Cauchy cdf, green=normal cdf"))

x <- seq(-5,5,1)
t <- c(-3,0,3)
ecdfHT.h(x,t)
p <- seq(0.05,.95,.1)
q <- c(.1,.5,.9)
ecdfHT.g(p,q)




