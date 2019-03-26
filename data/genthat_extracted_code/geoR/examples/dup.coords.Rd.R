library(geoR)


### Name: dup.coords
### Title: Locates duplicated coordinates
### Aliases: dup.coords dup.coords.default dup.coords.geodata
###   duplicated.geodata
### Keywords: spatial manip

### ** Examples

## simulating data
dt <- grf(30, cov.p=c(1, .3)) 
## "forcing" some duplicated locations
dt$coords[4,] <- dt$coords[14,] <- dt$coords[24,] <- dt$coords[2,]
dt$coords[17,] <- dt$coords[23,] <- dt$coords[8,]
## output of the method for geodata
dup.coords(dt)
## which is the same as a method for duplicated()
duplicated(dt)
## the default method:
dup.coords(dt$coords)



