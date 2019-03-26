library(geoCount)


### Name: plotData
### Title: Plot Geostatistical Data
### Aliases: plotData
### Keywords: Data

### ** Examples

## Not run: 
##D loc1 <- locGrid(1, 1, 10, 10)
##D loc2 <- locCircle(0.72, 60)
##D loc3 <- locSquad(0.38, 10)
##D loc <- rbind(as.matrix(loc1) , loc2, loc3); plot(loc)
##D dat <- simData(loc, cov.par = c(1, 0.2, 1))
##D Y <- dat$data
##D plotData(Y[1:nrow(loc1)], loc1, 
##D          Y[(nrow(loc1)+1):(nrow(loc1)+nrow(loc2))], loc2, 
##D          Y[(length(Y)-nrow(loc3)+1):length(Y)], loc3, 
##D          xlab="x", ylab="y", pchs = c(1, 16, 15)
##D          )
##D # plot boundaries
##D data(TexasCounty_boundary)
##D plotData(bdry = TexasCounty.boundary)
##D # plot data with the boundary
##D data(Rongelap)
##D str(Rongelap)
##D plotData(bdry = Rongelap$borders, Y = Rongelap$data, loc = Rongelap$coords)
## End(Not run)



