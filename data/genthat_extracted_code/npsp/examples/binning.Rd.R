library(npsp)


### Name: binning
### Title: Linear binning
### Aliases: as.bin.data as.bin.data.bin.data as.bin.data.data.grid
###   bin.data bin.data-class binning

### ** Examples

with(earthquakes, spoints(lon, lat, mag, main = "Earthquake data"))

bin <- binning(earthquakes[, c("lon", "lat")], earthquakes$mag, nbin = c(30,30), set.NA = TRUE)

simage(bin, main = "Binning averages")
with(earthquakes, points(lon, lat, pch = 20))



