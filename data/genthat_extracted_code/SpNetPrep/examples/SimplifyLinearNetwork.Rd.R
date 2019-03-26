library(SpNetPrep)


### Name: SimplifyLinearNetwork
### Title: Simplifies a linear network object by merging the edges that
###   meet at a second-degree vertex if some conditions on the angle they
###   form and on their lengths are satisfied
### Aliases: SimplifyLinearNetwork

### ** Examples

library(SpNetPrep)
library(spatstat)
library(sp)
library(raster)
library(maptools)
network <- chicago$domain
Angle <- 10
Length <- 20
simplified_network_1 <- SimplifyLinearNetwork(network,Angle=Angle,Length=Length)
## Not run: 
##D M <- matrix(c(10,60,40,25),nrow=2)
##D simplified_network_2 <- SimplifyLinearNetwork(network,M=M)
## End(Not run)



