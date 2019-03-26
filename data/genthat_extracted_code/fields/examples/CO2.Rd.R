library(fields)


### Name: CO2
### Title: Simulated global CO2 observations
### Aliases: CO2 CO2.true
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D data(CO2)
##D #
##D # A quick look at the observations with world map
##D quilt.plot( CO2$lon.lat, CO2$y)
##D world( add=TRUE)
##D 
##D # Note high concentrations in Borneo (biomass burning), Amazonia and
##D # ... Michigan (???).
##D 
##D # spatial smoothing using the wendland compactly supported covariance
##D # see help( fastTps) for details
##D # First smooth using locations and Euclidean distances 
##D # note taper is in units of degrees 
##D out<-fastTps( CO2$lon.lat, CO2$y, theta=4, lambda=2.0) 
##D #summary of fit note about 7300 degrees of freedom 
##D # associated with fitted surface
##D  print( out)
##D # image plot on a grid  (this takes a while)
##D surface( out, type="I", nx=300, ny=150)
##D # smooth with respect to great circle distance 
##D out2<-fastTps( CO2$lon.lat, CO2$y, lon.lat=TRUE,lambda=1.5, theta=4*68) 
##D print(out2)
##D #surface( out2, type="I", nx=300, ny=150)
##D 
##D # these data are actually subsampled from a grid. 
##D # create the image object that holds the data
##D #
##D 
##D temp<- matrix( NA, ncol=ncol(CO2.true$z), nrow=nrow(CO2.true$z))
##D temp[ CO2.true$mask] <- CO2$y
##D 
##D # look at gridded object. 
##D  image.plot(CO2.true$x,CO2.true$y, temp)
##D 
##D # to predict _exactly_ on this grid for the second fit;
##D # (this take a while)
##D look<- predictSurface( out2, grid.list=list( x=CO2.true$x, y=CO2.true$y))
##D image.plot(look)
##D 
## End(Not run)



