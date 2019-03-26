library(adegraphics)


### Name: adeg.panel.join
### Title: Panel function for joining lines.
### Aliases: adeg.panel.join
### Keywords: aplot

### ** Examples

if(require(lattice, quietly = TRUE)) {
  xyplot(0:20 ~ 0:20, drawLines = c(5, 10, 15), params = list(plabels.cex = 2), 
    panel = function(drawLines, params){
      adeg.panel.join(drawLines = drawLines, params = params)})
}


