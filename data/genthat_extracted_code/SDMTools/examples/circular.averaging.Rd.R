library(SDMTools)


### Name: circular.averaging
### Title: Circular Averaging based on Vector Averaging
### Aliases: circular.averaging vector.averaging

### ** Examples

#EXAMPLE circular.averaging
circular.averaging(c(0,90,180,270)) #result is NA
circular.averaging(c(70,82,96,110,119,259))

#EXAMPLE vector.averaging
vector.averaging(c(10,20,70,78,108), distance=10)
vector.averaging(c(159,220,258,273,310),distance=runif(5))



