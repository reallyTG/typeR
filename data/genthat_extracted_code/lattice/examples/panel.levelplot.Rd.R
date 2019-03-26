library(lattice)


### Name: F_1_panel.levelplot
### Title: Panel Functions for levelplot and contourplot
### Aliases: panel.levelplot panel.contourplot panel.levelplot.raster
### Keywords: dplot

### ** Examples


require(grid)

levelplot(rnorm(10) ~ 1:10 + sort(runif(10)), panel = panel.levelplot)

suppressWarnings(plot(levelplot(rnorm(10) ~ 1:10 + sort(runif(10)),
                                panel = panel.levelplot.raster,
                                interpolate = TRUE)))

levelplot(volcano, panel = panel.levelplot.raster)

levelplot(volcano, panel = panel.levelplot.raster,
          col.regions = topo.colors, cuts = 30, interpolate = TRUE)




