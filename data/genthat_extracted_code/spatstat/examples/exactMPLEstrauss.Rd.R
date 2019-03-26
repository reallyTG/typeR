library(spatstat)


### Name: exactMPLEstrauss
### Title: Exact Maximum Pseudolikelihood Estimate for Stationary Strauss
###   Process
### Aliases: exactMPLEstrauss
### Keywords: spatial models

### ** Examples

## Don't show: 
   exactMPLEstrauss(cells, 0.1, ngrid=128)
   exactMPLEstrauss(cells, 0.1, ngrid=128, project=FALSE)
## End(Don't show)
if(interactive()) {
   exactMPLEstrauss(cells, 0.1)
   coef(ppm(cells, ~1, Strauss(0.1)))
   coef(ppm(cells, ~1, Strauss(0.1), nd=128))
   exactMPLEstrauss(redwood, 0.04)
   exactMPLEstrauss(redwood, 0.04, project=FALSE)
   coef(ppm(redwood, ~1, Strauss(0.04)))
}



