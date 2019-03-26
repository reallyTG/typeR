library(MapGAM)


### Name: plot.modgam
### Title: Maps Predicted Values and Clusters for 'modgam' Objects
### Aliases: plot.modgam
### Keywords: hplot misc smooth

### ** Examples

## No test: 
data(MAmap)		
data(MAdata) 
# Create a grid on the base map (PBSmapping package recommended)
if(require(PBSmapping)) MAgrid <- predgrid(MAdata, map=MAmap) else 
MAgrid <- predgrid(MAdata)		
# fit crude GAM model to the MA data using span size of 50%
fit1 <- modgam(data=MAdata, rgrid=MAgrid, m="crude", sp=0.5)  
# Plot a map showing crude odds ratios
plot(fit1, MAmap)					

#### A detailed example including map projections and data trimming
# NOTE: this example requires the maps, mapproj, and PBSmapping packages
# Convert base map and beer tweet data locations to US Albers projection 
# projected coords yield better distance estimates than (lat,long)
if(require(maps) & require(mapproj) & require(PBSmapping)) {
  USmap <- map("state",projection="albers",parameters=c(29.5,45.5),
               plot=FALSE,fill=TRUE,col="transparent")
  data(beertweets)
  case <- beertweets$beer
  # Reuse last map projection to convert data coordinates	
  XY <- mapproject(beertweets$longitude,beertweets$latitude)[1:2]  
  beerproj <- data.frame(case, XY[1], XY[2])			 
  # Generate grid on the US map, trimmed to range of beer data
  USgrid <- predgrid(beerproj, map=USmap)						
  # Fit unadjusted model--geolocation only
  fit2 <- modgam(data=beerproj, rgrid=USgrid, m="unadjusted", sp=0.05)	
  dev.new(width=7,height=5)
  plot(fit2, USmap)
  title(main="Beer Tweet Odds Ratios")	
}
## End(No test)



