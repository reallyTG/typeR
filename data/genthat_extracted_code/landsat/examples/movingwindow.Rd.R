library(landsat)


### Name: movingwindow
### Title: Simple moving window function.
### Aliases: movingwindow
### Keywords: stats

### ** Examples

	data(dem)
	dem.smoothed <- movingwindow(dem, matrix(c(1,1,1,1,0,1,1,1,1), 3, 3)/8)

	par(mfrow=c(1,2))
	image(dem)
	image(dem.smoothed)



