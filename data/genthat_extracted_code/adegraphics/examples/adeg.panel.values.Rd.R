library(adegraphics)


### Name: adeg.panel.values
### Title: Panel function drawing a third variable into a two-dimensional
###   scatterplot
### Aliases: adeg.panel.values
### Keywords: aplot

### ** Examples

if(require(lattice, quietly = TRUE)) {
param <- adegpar("ppoints")[[1]]
param$col <- adegpar("ppalette")[[1L]]$quanti(2)
z <- rnorm(10)
xyplot(1:10 ~ 1:10, panel = function(x, y, ...){
  adeg.panel.values(x, y, z, method = "size", symbol = "square", ppoints =
  param, breaks = pretty(z, 4))})
}

if(require(lattice, quietly = TRUE)) {
param$col <- adegpar()$ppalette$quali((length(pretty(z, 2)) - 1))
xyplot(1:10 ~ 1:10, panel = function(x, y, ...){
  adeg.panel.values(x, y, z, method = "color", symbol = "circle", 
                    ppoints = param, breaks = pretty(z, 2))}) 
}



