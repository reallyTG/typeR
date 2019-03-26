library(GISTools)


### Name: phenology
### Title: Phenology data for North American lilacs
### Aliases: phenology chinensis chinensis2

### ** Examples

# Read in the data
data(phenology)
# Split the plot in two
par(mfrow=c(2,1))
# Plot US states
plot(us_states2)
# Add Locations of observation stations
plot(chinensis2,add=TRUE,pch=16,col='red')
# Plot a histogram of year of observation next to this
hist(chinensis2$Year)



