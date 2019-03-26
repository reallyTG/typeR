library(SpatialExtremes)


### Name: rainfall
### Title: Summer annual maxima precipitation in Switzerland
### Aliases: rainfall
### Keywords: datasets

### ** Examples

data(rainfall)
op <- par(mfrow = c(1,2),pty = "s", mar = c(0,0,0,0))
swiss(city = TRUE)
idx.site <- c(1, 10, 20)
points(coord[-idx.site,])
points(coord[idx.site,], pch = 15, col = 2:4)

par(mar = c(2,4,0,0))
plot(1962:2008, rain[,1], type = "b", xlab = "Year", ylab =
"Precipitation (cm)", ylim = c(0, 120), col = 2)
lines(1962:2008, rain[,10], col = 3, type = "b")
lines(1962:2008, rain[,20], col = 4, type = "b")
par(op)



