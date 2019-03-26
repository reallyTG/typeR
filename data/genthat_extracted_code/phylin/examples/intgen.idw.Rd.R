library(phylin)


### Name: intgen.idw
### Title: Interpolation of genetic distances to a a grid of points.
### Aliases: intgen.idw
### Keywords: idw interpolation

### ** Examples

    data(vipers)
    data(d.gen)
    data(grid)

    # create a matrix of distances from sample points (columns) to all
    # grid pixels
    rd <- real.dist(vipers[,1:2], grid)

    #interpolate with idw
    result <- intgen.idw(rd, d.gen)

    #plot the 12 random interpolations
    layout(matrix(c(1:12), 4,3))

    for (i in sample(1:nrow(vipers), 12))
    {
        dt <- data.frame(grid, int=result[,i])
        # when samples are given with real coordinates, aspect of image 
        # should be maintained with asp=1 to plot properly. 
        image(sort(unique(grid[,1])), sort(unique(grid[,2])), 
              xtabs(int~x+y, dt), xlab='Longitude', ylab='Latitude', 
              main=colnames(result)[i])
        cex <- (d.gen[,i]-min(d.gen[,i]))/(max(d.gen[,i])-min(d.gen[,i]))
        points(vipers[,1:2], cex=cex+0.5)
    }



