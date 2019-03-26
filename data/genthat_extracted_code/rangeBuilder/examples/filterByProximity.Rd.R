library(rangeBuilder)


### Name: filterByProximity
### Title: Filter by proximity
### Aliases: filterByProximity

### ** Examples

data(crotalus)

# within the first 100 points in the dataset, identify the set of points to 
# drop in order to have points no closer to each other than 20 km

subset <- crotalus[1:100,]
tooClose <- filterByProximity(xy= subset[ ,c('decimallongitude','decimallatitude')], 
	dist=20, mapUnits = FALSE, returnIndex = TRUE)

plot(subset[ ,c('decimallongitude','decimallatitude')], pch=1, col='blue', cex=1.5)
points(subset[tooClose, c('decimallongitude','decimallatitude')], pch=20, col='red')




