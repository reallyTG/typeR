library(siland)


### Name: dataCmoth
### Title: Data set for codling moth counts
### Aliases: dataCmoth
### Keywords: datasets

### ** Examples

## No test: 
data(landCmoth)
data(dataCmoth)
#conventional pixels
plot(landCmoth[[1]][,c("X","Y")],pch=16,cex=0.3,col=1)
#organic pixels
points(landCmoth[[2]][,c("X","Y")],pch=16,cex=0.3,col=2 )
#vine pixels
points(landCmoth[[3]][,c("X","Y")],pch=16,cex=0.3,col=3 )
#measurement locations
points(dataCmoth[,c("X","Y")],pch=16,cex=0.8,col=4)
## End(No test)





