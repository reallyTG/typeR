library(hexbin)


### Name: plotMAhex
### Title: MA-plot using hexagon bins
### Aliases: plotMAhex
### Keywords: hplot

### ** Examples

  if(require(marray)){ 
    data(swirl)
    hb <- plotMAhex(swirl[,1],newpage=FALSE,
                    main = "M vs A plot with hexagons", legend=0)
    hexVP.abline(hb$plot.vp,h=0,col=gray(.6))
    hexMA.loess(hb)
  }



