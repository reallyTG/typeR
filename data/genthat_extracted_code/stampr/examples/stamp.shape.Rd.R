library(stampr)


### Name: stamp.shape
### Title: Compute shape indices on 'stamp' output
### Aliases: stamp.shape
### Keywords: stamp

### ** Examples

library(sp)
library(rgeos)
library(raster)
data("fire1")
data("fire2")
#set globally unique ID column required for stamp function
fire1$ID <- 1:nrow(fire1) 
#set globally unique ID column required for stamp function
fire2$ID <- (max(fire1$ID)+1):(max(fire1$ID) + nrow(fire2)) 
ch <- stamp(fire1, fire2, dc=1, direction=FALSE, distance=FALSE)
ch.sh <- stamp.shape(T1 = fire1, T2 = fire2, stmp = ch, index = 'LIN')



