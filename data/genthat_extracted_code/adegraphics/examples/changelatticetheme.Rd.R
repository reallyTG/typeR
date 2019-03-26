library(adegraphics)


### Name: changelatticetheme
### Title: Change the 'lattice' theme used for 'adegraphics'
### Aliases: changelatticetheme
### Keywords: iplot

### ** Examples

if(require(lattice, quietly = TRUE)) {
  show.settings()
  changelatticetheme(list(superpose.symbol = list(pch = c(21, 22, 35), cex = 1)))
  show.settings()
  show.settings()[1]
}



