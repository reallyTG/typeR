library(spatstat)


### Name: Kmeasure
### Title: Reduced Second Moment Measure
### Aliases: Kmeasure
### Keywords: spatial nonparametric

### ** Examples

 plot(Kmeasure(cells, 0.05))
 # shows pronounced dip around origin consistent with strong inhibition
 plot(Kmeasure(redwood, 0.03), col=grey(seq(1,0,length=32)))
 # shows peaks at several places, reflecting clustering and ?periodicity
 M <- Kmeasure(cells, 0.05)
 # evaluate measure on a sector
 W <- Window(M)
 ang <- as.im(atan2, W)
 rad <- as.im(function(x,y){sqrt(x^2+y^2)}, W)
 sector <- solutionset(ang > 0 & ang < 1 & rad < 0.6)
 integral.im(M[sector, drop=FALSE])



