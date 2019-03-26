library(rtop)


### Name: plot.rtopVariogramCloud
### Title: Plot and Identify Data Pairs on Sample Variogram Cloud
### Aliases: plot.rtopVariogramCloud
### Keywords: dplot

### ** Examples

## Not run: 
##D rpath = system.file("extdata",package="rtop")
##D observations = readOGR(rpath,"observations")
##D observations$obs = observations$QSUMMER_OB/observations$AREASQKM
##D 
##D # Create the sample variogram
##D rtopVario = rtopVariogram(observations, params = list(cloud = TRUE))
##D plot(rtopVario)
##D 
## End(Not run)



