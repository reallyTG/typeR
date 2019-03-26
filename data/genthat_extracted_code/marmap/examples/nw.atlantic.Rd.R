library(marmap)


### Name: nw.atlantic
### Title: Bathymetric data for the North West Atlantic
### Aliases: nw.atlantic

### ** Examples

# load NW Atlantic data
data(nw.atlantic)

# use as.bathy
atl <- as.bathy(nw.atlantic)

# class "bathy"
class(atl)
summary(atl)

# test plot.bathy
plot(atl, deep=-8000, shallow=-1000, step=1000)




