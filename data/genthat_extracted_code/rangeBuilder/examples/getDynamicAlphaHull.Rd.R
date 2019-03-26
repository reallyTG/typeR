library(rangeBuilder)


### Name: getDynamicAlphaHull
### Title: Generate polygon based on alpha hulls
### Aliases: getDynamicAlphaHull

### ** Examples

data(crotalus)

# create a polygon range for Crotalus atrox
x <- crotalus[which(crotalus$genSp == 'Crotalus_atrox'),]
x <- x[sample(1:nrow(x), 50),]

range <- getDynamicAlphaHull(x, coordHeaders=c('decimallongitude','decimallatitude'), 
	clipToCoast = 'no')

plot(range[[1]], col=transparentColor('dark green', 0.5), border = NA)
points(x[,c('decimallongitude','decimallatitude')], cex = 0.5, pch = 3)

# to add a basic coastline
# plot(gshhs, add = TRUE)




