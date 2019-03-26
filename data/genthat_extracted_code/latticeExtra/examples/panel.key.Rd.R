library(latticeExtra)


### Name: panel.key
### Title: Draw a simple key inside a panel of a lattice plot.
### Aliases: panel.key
### Keywords: aplot

### ** Examples

xyplot(ozone ~ wind | equal.count(temperature, 2),
       data = environmental) +
   layer(panel.loess(x, y, span = 0.5), style = 1) +
   layer(panel.loess(x, y, span = 1.0), style = 2) +
   layer(panel.key(c("span = 0.5", "span = 1.0"), corner = c(1,.98),
                   lines = TRUE, points = FALSE), packets = 1)



