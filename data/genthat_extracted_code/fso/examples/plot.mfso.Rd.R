library(fso)


### Name: plot.mfso
### Title: Plotting Routines for Multidimensional Fuzzy Set Ordinations
### Aliases: plot.mfso points.mfso plotid.mfso hilight.mfso chullord.mfso
###   boxplot.mfso thull.mfso
### Keywords: hplot aplot iplot

### ** Examples

    require(labdsv) # to obtain access to data sets and dissimilarity function
    data(bryceveg) # vegetation data
    data(brycesite) # environmental data
    dis.bc <- dsvdis(bryceveg,'bray/curtis') # produce \sQuote{dist} object
    demo.mfso <- mfso(~elev+slope+av,dis.bc,data=brycesite)
    plot(demo.mfso)
    ## Not run: hilight(demo.mfso,brycesite$quad) # requires interaction



