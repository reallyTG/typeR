library(latticeExtra)


### Name: ecdfplot
### Title: Trellis Displays of Empirical CDF
### Aliases: ecdfplot ecdfplot.formula ecdfplot.numeric panel.ecdfplot
###   prepanel.ecdfplot
### Keywords: dplot

### ** Examples


data(singer, package = "lattice")
ecdfplot(~height | voice.part, data = singer)




