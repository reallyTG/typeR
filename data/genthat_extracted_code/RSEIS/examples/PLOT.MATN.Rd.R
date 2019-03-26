library(RSEIS)


### Name: PLOT.MATN
### Title: plot a matrix of several seismograms
### Aliases: PLOT.MATN
### Keywords: hplot

### ** Examples


dt  <-  0.001

 t  <-  seq(0, 6, by=0.001)

thefreqs  <-  seq(from=10, to=100, by=10)
theamps  <-   runif(length(thefreqs))

#   sample rate is 1000 Hz, 0.001 seconds 601 samples
 x  <-  NULL

for(i in 1:length(thefreqs))
{
x  <-  cbind(x, theamps[i]*sin(2*pi*thefreqs[i]*t))


}

PLOT.MATN(x,  dt = dt)





