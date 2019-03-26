library(fso)


### Name: plot.fso
### Title: Plotting Routines for Fuzzy Set Ordinations
### Aliases: plot.fso points.fso plotid.fso hilight.fso chullord.fso
###   boxplot.fso
### Keywords: hplot aplot iplot

### ** Examples

    require(labdsv) # to obtain access to data sets and dissimilarity function
    data(bryceveg) # vegetation data
    data(brycesite) # environmental data
    dis.bc <- dsvdis(bryceveg,'bray/curtis') # produce \sQuote{dist} object
    demo.fso <- fso(~elev+slope+av,dis.bc,data=brycesite)
    ## Not run: plot(demo.fso)
    ## Not run: hilight(demo.mfso,brycesite$quad)



