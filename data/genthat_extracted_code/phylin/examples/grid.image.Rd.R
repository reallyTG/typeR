library(phylin)


### Name: grid.image
### Title: Simple plot of interpolated grid.
### Aliases: grid.image
### Keywords: interpolation kriging idw image

### ** Examples

    data(vipers)
    data(d.gen)

    # create a grid of the sampled area for inteprolation
    grid <- expand.grid(x=seq(-9.5,3,0.25), y=seq(36, 43.75, 0.25))

    # create a distance matrix between samples
    r.dist <- dist(vipers[,1:2])

    # fit a model with defaults (shperical model) and estimation of range
    gv <- gen.variogram(r.dist, d.gen, 0.25)
    gv <- gv.model(gv)

    # interpolation of the distances to first sample with ordinary kriging
    int.krig <- krig(d.gen[,1], vipers[,1:2], grid, gv)

    #plot the interpolation results
    grid.image(int.krig, grid, main='Krigging Interpolation', 
               xlab='Longitude',ylab = 'Latitude', 
               sclab=paste('Genetic distance to sample', 
               colnames(d.gen)[1]))

    # User can add extra elements to the main plot.
    points(vipers[,1:2], cex=d.gen[,1]*15+0.2) 




