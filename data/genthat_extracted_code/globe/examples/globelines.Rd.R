library(globe)


### Name: globeplot
### Title: Plot points, lines and arrows on a globe
### Aliases: globepoints globelines globearrows
### Keywords: spatial

### ** Examples

ex1 <- matrix(nrow=3, ncol=2)
ex1[1,1] <- -80
ex1[1,2] <- 45
ex1[2,1] <- -60
ex1[2,2] <- 45
ex1[3,1] <- -50
ex1[3,2] <- 50
globeearth(eye=place("newyorkcity"))
globepoints(loc=ex1)
globelines(loc=ex1)
globearrows(loc=ex1)



