library(hexbin)


### Name: hexMA.loess
### Title: Add Loess Fit to Hexplot
### Aliases: hexVP.loess hexMA.loess
### Keywords: aplot

### ** Examples

  if(require(marray)){
    data(swirl)
    
    hb <- plotMAhex(swirl[,1], main = "M vs A plot with hexagons", legend=0)
    hexVP.abline(hb$plot, h=0, col= gray(.6))
    hexMA.loess(hb)
  }



