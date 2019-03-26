library(MapGAM)


### Name: modgam
### Title: Fit a Generalized Additive Model (GAM) with a Two-Dimensional
###   Smooth and Make Predictions
### Aliases: modgam
### Keywords: misc smooth

### ** Examples

## No test: 
# Load base map in SpatialPolygonsDataFrame format
# This map was read from ESRI shapefiles using the readShapePoly function
data(MAmap)	
# Load data and create grid on base map
data(MAdata)							
gamgrid <- predgrid(MAdata, map=MAmap)    # requires PBSmapping package		
# Fit crude logistic GAM to the MA data using span size of 50%
# and predict odds ratios for every point on gamgrid
fit1 <- modgam(data=MAdata, rgrid=gamgrid, m="crude", sp=0.5)  
# Summary statistics for pointwise crude odds ratios 
summary(fit1$exp.fit)			
# Summary stats for pointwise crude log odds (linear predictor) 
summary(fit1$fit)			

# fit adjusted GAM using span size of 50%, 
# including a (too small) conditional permutation test
fit2 <- modgam(data=MAdata, rgrid=gamgrid, permute=25, m="adjusted", sp=0.5)  
fit2

# fit adjusted GAM by specifiying formula
fit2.f <- modgam(Case~lo(Xcoord,Ycoord)+Smoking + Mercury + Selenium,data=MAdata,
          rgrid=gamgrid, sp=0.5)
fit2.f

# Detailed example with a continuous outcome variable, map projections, 
# and data trimming:  investigating tweet times by geolocation
# NOTE: this example requires the maps, mapproj, and PBSmapping packages
# Convert base map and beer tweet data locations to US Albers projection 
# for better distance estimates than using (lat,long) as (X,Y) coords 
if(require(maps) & require(mapproj) & require(PBSmapping)) {
	USmap <- map("state",projection="albers",parameters=c(29.5,45.5),
		plot=FALSE,fill=TRUE,col="transparent")
	data(beertweets)
	# Reuse last map projection to convert data coordinates	
	XY <- mapproject(beertweets$longitude,beertweets$latitude)[1:2]  
	jtime <- julian(beertweets$time)
	# Convert tweet dates and times to time of day (24-hour)
	tweettime <- as.numeric(jtime-trunc(jtime))*24
	beerproj <- data.frame(tweettime, XY[1], XY[2], beertweets$beer)			 
	# Generate grid on the US map, trimmed to range of beer data
	USgrid <- predgrid(beerproj, map=USmap)						
	# Fit adjusted model--adjusting for beer indicator variable 
	fit3 <- modgam(data=beerproj, rgrid=USgrid, family=gaussian, 
		reference="none", m="adjusted", sp=0.05)	
	# Get summary statistics for predicted tweet times across grid points 
	summary(fit3$fit)	
}

# Smoothing survival rates over geolocations with adjustement of Age and Insurance
# Including generating pointwise standard errors and confidence intervals
data(CAdata)
data(CAgrid)
data = CAdata[1:1000,]	# use a subset of the California data
# manually set the categorical variables as factors
data$INS = factor(data$INS)
# no formula needed if data are arranged in a specific order (see \code{data} argument)
fit4 <- modgam(data=data, rgrid=CAgrid, family="survival", sp=0.2)
fit4
# fit the same model using the formula argument, with data columns in any order
fit4.f <- modgam(Surv(time,event)~AGE+factor(INS)+lo(X,Y), data=data,
                rgrid = CAgrid, family="survival", sp=0.2)

# Smoothing for two-dimensional chemical exposure instead of geolocation
# case status in 1st column, mercury and selenium in 2nd and 3rd columns   
ma2 <- MAdata[,c(1,5:6)]  
expgrid <- predgrid(ma2)
fit5 <- modgam(data=ma2,rgrid=expgrid,sp=.5,m="crude") 
summary(fit5$exp.fit)
# plot the results, with mercury on the X axis and selenium on the Y axis
plot(fit5, contours="response", arrow=FALSE, axes=TRUE) 
## End(No test)



