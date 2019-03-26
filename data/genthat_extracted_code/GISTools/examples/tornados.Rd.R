library(GISTools)


### Name: tornados
### Title: US Tornado Touchdown Data
### Aliases: tornados torn torn2

### ** Examples

# Read in the data
data(tornados)
# Split the plot in two
par(mfrow=c(2,1))
# Plot US states
plot(us_states)
# Add Locations of observation stations
plot(torn,add=TRUE,pch=16,col='red')
# Plot a histogram of year of observation next to this
hist(torn$YEAR)



