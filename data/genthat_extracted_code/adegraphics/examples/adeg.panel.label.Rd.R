library(adegraphics)


### Name: adeg.panel.label
### Title: Panel function for adding labels.
### Aliases: adeg.panel.label
### Keywords: aplot

### ** Examples

if(require(lattice, quietly = TRUE)) {
param <- adegpar("plabels")[[1]]
xyplot(1:10 ~ 1:10, panel = function(x, y, ...){
  adeg.panel.label(x, y, LETTERS[1:10], plabels = param)})
}

if(require(lattice, quietly = TRUE)) {
param$boxes$draw <- FALSE
param$col <- "blue"
xyplot(1:10 ~ 1:10, panel = function(x, y, ...){
  adeg.panel.label(x, y, LETTERS[1:10], plabels = param)})
}



