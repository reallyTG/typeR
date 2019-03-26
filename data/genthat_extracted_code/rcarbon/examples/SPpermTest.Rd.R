library(rcarbon)


### Name: SPpermTest
### Title: Spatial Permutation Test of summed probability distributions.
### Aliases: SPpermTest

### ** Examples

## Reproduce Crema et al 2017 ##
## Not run: 
##D data(euroevol) #load data
##D 
##D ## Subset only for 8000 to 5000 Cal BP (c7200-4200 C14BP)
##D edge=800
##D timeRange=c(8000,5000)
##D euroevol2=subset(euroevol,C14Age<=c(timeRange[1]-edge)&C14Age>=c(timeRange[2]-edge))
##D 
##D ## define chronological breaks
##D breaks=seq(8000,5000,-500)
##D 
##D ## Create a SpatialPoints class object 
##D library(sp)
##D sites = unique(data.frame(SiteID=euroevol2$SiteID,
##D Longitude=euroevol2$Longitude,Latitude=euroevol2$Latitude))
##D locations=data.frame(Longitude=sites$Longitude,Latitude=sites$Latitude)
##D rownames(locations)=sites$SiteID
##D coordinates(locations)<-c("Longitude","Latitude")
##D proj4string(locations)<- CRS("+proj=longlat +datum=WGS84")
##D 
##D ## Compute Distance and Spatial Weights 
##D distSamples=spDists(locations,locations,longlat = TRUE)
##D spatialweights=spweights(distSamples,h=100) #using a kernal bandwidth of 100km
##D 
##D ## Calibration and binning
##D bins=binPrep(sites=euroevol2$SiteID,ages=euroevol2$C14Age,h=200)  
##D calDates=calibrate(x=euroevol2$C14Age,errors=euroevol2$C14SD,
##D timeRange=timeRange,normalised=FALSE)
##D 
##D ## Main Analysis (over 2 cores; requires doParallel package) 
##D ## NOTE: the number of simulations should be ideally larger 
##D ## to ensure a better resolution of the p/q-values.
##D res.locations=SPpermTest(calDates,timeRange=timeRange,bins=bins,locations=locations,
##D spatialweights=spatialweights,breaks=breaks,ncores=2,nsim=100,
##D permute="locations",datenormalised=FALSE)
##D 
##D ## Plot results
##D library(rworldmap)
##D base=getMap(resolution="low") #optionally add base map
##D #retrieve coordinate limits#
##D xrange=bbox(res.locations$locations)[1,] 
##D yrange=bbox(res.locations$locations)[2,]
##D 
##D par(mfrow=c(2,2))  
##D par(mar=c(0.1,0.1,0,0.5))
##D plot(base,col="antiquewhite3",border="antiquewhite3",xlim=xrange,ylim=yrange)
##D plot(res.locations,index=4,add=TRUE,option="raw",breakRange=c(-0.005,0.005)) 
##D plot(res.locations,option="rawlegend",breakRange=c(-0.005,0.005),rd=3)
##D par(mar=c(0.1,0.1,0,0.5))
##D plot(base,col="antiquewhite3",border="antiquewhite3",xlim=xrange,ylim=yrange) 
##D plot(res.locations,index=4,add=TRUE,option="test")  
##D plot(res.locations,option="testlegend")
## End(Not run)



