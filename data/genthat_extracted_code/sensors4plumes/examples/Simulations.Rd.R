library(sensors4plumes)


### Name: Simulations-class
### Title: Class "Simulations"
### Aliases: Simulations Simulations-class
###   coerce,Simulations,SpatialDataFrame-method nLocations
###   nLocations.Simulations nLocations,Simulations-method nPlumes
###   nPlumes.Simulations nPlumes,Simulations-method nKinds
###   nKinds.Simulations nKinds,Simulations-method
### Keywords: classes

### ** Examples

# generate Simulations object: small, artificial example
data(SPixelsDF)
plumes = data.frame(source = c("A", "A", "B", "B", "B"),
                    date = c("2000-01-01", "2000-04-01", 
                             "2000-07-01", "2000-01-01", "2000-01-03"),
                    totalCost = runif(5, min = 5, max = 15))

values1 = replicate(n = nrow(plumes), expr = rlnorm(length(SPixelsDF), sdlog = 2))
values2 = replicate(n = nrow(plumes), expr = rnorm(length(SPixelsDF), m = 10, sd = 3))
values = stack(raster(x = values1, xmn = -90, xmx = 90, ymn = -90, ymx = 90, 
                      crs = "+init=epsg:4326" ), 
               raster(x = values2, xmn = -90, xmx = 90, ymn = -90, ymx = 90, 
                      crs = "+init=epsg:4326" ))

Simulations1 = Simulations(locations = SPixelsDF, plumes, values)

# nLocations, nPlumes, nKinds
nLocations(Simulations1)
nPlumes(Simulations1)
nKinds(Simulations1)




