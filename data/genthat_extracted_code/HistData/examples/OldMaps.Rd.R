library(HistData)


### Name: OldMaps
### Title: Latitudes and Longitudes of 39 Points in 11 Old Maps
### Aliases: OldMaps
### Keywords: datasets spatial

### ** Examples

data(OldMaps)
## maybe str(OldMaps) ; plot(OldMaps) ...

with(OldMaps, plot(abs(long),abs(lat), pch=col, col=colors()[point]))



