library(geoR)


### Name: jitterDupCoords
### Title: Jitters (duplicated) coordinates.
### Aliases: jitterDupCoords jitterDupCoords.default
###   jitterDupCoords.geodata jitter2d
### Keywords: spatial manip

### ** Examples

## simulating data
dt <- grf(30, cov.p=c(1, .3)) 
dt$coords <- round(dt$coords, dig=2)
## "forcing" some duplicated locations
dt$coords[4,] <- dt$coords[14,] <- dt$coords[24,] <- dt$coords[2,]
dt$coords[17,] <- dt$coords[23,] <- dt$coords[8,]

## jittering a matrix of duplicated coordinates
dt$coords[c(2,4,14,24),]
jitter2d(dt$coords[c(2,4,14,24),], max=0.01)

## jittering only the duplicated locations and comparing with original
cbind(dt$coords, jitterDupCoords(dt$coords, max=0.01))

## creating a now geodata object jittering the duplicated locations of the original one:
dup.coords(dt)
dt1 <- jitterDupCoords(dt, max=0.01)
dup.coords(dt1)



