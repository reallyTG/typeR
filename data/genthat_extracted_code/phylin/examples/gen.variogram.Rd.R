library(phylin)


### Name: gen.variogram
### Title: Semi-variogram with the genetic distance matrix
### Aliases: gen.variogram
### Keywords: variogram kriging

### ** Examples


    data(vipers)
    data(d.gen)

    # create a distance matrix between samples
    r.dist <- dist(vipers[,1:2])

    # variogram table with semi-variance and lag centers
    gv <- gen.variogram(r.dist, d.gen)

    # plot variogram
    plot(gv)

    # fit a new variogram with different lag
    gv2 <- gen.variogram(r.dist, d.gen, lag=0.2)
    plot(gv2)




