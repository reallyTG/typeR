library(polySegratioMM)


### Name: dumpData
### Title: Dumps segregation ratio data to file for subsequent JAGS run
### Aliases: dumpData
### Keywords: manip data

### ** Examples

## simulate small autooctaploid data set
a1 <- sim.autoMarkers(8,c(0.7,0.2,0.1),n.markers=100,n.individuals=50)

## compute segregation ratios
sr <-  segregationRatios(a1$markers)

## set up model for 3 components of autooctoploid
x <- setModel(3,8)

dumpData(sr, x)




