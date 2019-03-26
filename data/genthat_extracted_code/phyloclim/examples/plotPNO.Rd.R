library(phyloclim)


### Name: plotPNO
### Title: Plot Predicted Niche Occupancy Profiles
### Aliases: plotPNO

### ** Examples

# load PNOs for Oxalis sect. Palmatifoliae
data(PNO)

# plot predicted niche occupany for annual mean temperature
plotPNO(x = PNO$AnnualMeanTemperature, 
	xlab = "Annual Mean Temperature (degree C)")
	
# same plot, but with weighted means added
plotPNO(x = PNO$AnnualMeanTemperature, 
	xlab = "Annual Mean Temperature (degree C)", wm = TRUE)



