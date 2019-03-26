library(MapGAM)


### Name: MapGAM-package
### Title: Mapping Smoothed Effect Estimates from Individual-Level Spatial
###   Data
### Aliases: MapGAM-package MapGAM
### Keywords: package smooth datasets hplot misc

### ** Examples

# Load synthetic data and a preformatted base map
data(MAmap)		
data(MAdata)
## No test: 
# Create a grid on the base map (PBSmapping package recommended)	
if(require(PBSmapping)) gamgrid <- predgrid(MAdata, map=MAmap) else
	 gamgrid <- predgrid(MAdata) 		
# Fit a GAM with a smooth term for spatial location
fit1 <- modgam(data=MAdata, rgrid=gamgrid, m="crude", sp=0.5)   
# Display odds ratio estimates on the base map
plot(fit1, MAmap, exp=TRUE)								
## End(No test)
#### See colormap and modgam help files for more examples 



