library(fields)


### Name: Chicago ozone test data
### Title: Data set of ozone measurements at 20 Chicago monitoring
###   stations.
### Aliases: ChicagoO3 ozone
### Keywords: datasets

### ** Examples

fit<- Tps(ChicagoO3$x, ChicagoO3$y) 
# fitting a surface to ozone measurements. 
surface( fit, type="I")



