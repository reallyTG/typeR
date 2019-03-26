library(rsMove)


### Name: sampleMove
### Title: sampleMove
### Aliases: sampleMove

### ** Examples

{

 require(raster)

# reference data
data(longMove)

 # sampling without reference grid
 obs.time = strptime(longMove$timestamp, "%Y-%m-%d %H:%M:%S")
 output <- sampleMove(longMove, obs.time, 7, distance.method='deg')

 # compare original vs new samples
 plot(longMove, col="black", pch=16)
 points(output$x, output$y, col="red", pch=15)

}



