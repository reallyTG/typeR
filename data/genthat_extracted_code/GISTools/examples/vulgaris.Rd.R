library(GISTools)


### Name: vulgaris
### Title: Phenology data for North American lilacs
### Aliases: vulgaris vulgaris2 us_states us_states2

### ** Examples

# Read in the data
data(vulgaris)
# Split the plot in two
par(mfrow=c(2,1))
# Plot US states
plot(us_states)
# Add Locations of observation stations
plot(vulgaris,add=TRUE,pch=16,col='red')
# Plot a histogram of year of observation next to this
hist(vulgaris$Year)



