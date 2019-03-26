library(plotfunctions)


### Name: plotsurface
### Title: Creates a colored surface plot from data frame input.
### Aliases: plotsurface

### ** Examples


# From the package graphics, see help(image):
x <- 10*(1:nrow(volcano))
y <- 10*(1:ncol(volcano))
image(x, y, volcano, col = terrain.colors(100), axes = FALSE)
contour(x, y, volcano, levels = seq(90, 200, by = 5),
        add = TRUE, col = "peru")
axis(1, at = seq(100, 800, by = 100))
axis(2, at = seq(100, 600, by = 100))
box()
title(main = "Maunga Whau Volcano", font.main = 4)

# now with plot surface:
# first convert to data frame
tmp <- data.frame(value = as.vector(volcano), 
    x = 10*rep(1:nrow(volcano), ncol(volcano)), 
    y = 10*rep(1:ncol(volcano), each=nrow(volcano)))
plotsurface(tmp, view=c('x', "y"), predictor='value', main="Maunga Whau Volcano")

# or with terrain colors:
plotsurface(tmp, view=c('x', "y"), predictor='value', 
    main="Maunga Whau Volcano", color="terrain")

# change color range:
plotsurface(tmp, view=c('x', "y"), predictor='value', 
    main="Maunga Whau Volcano", zlim=c(0,200))

#' remove color and color legend:
plotsurface(tmp, view=c('x', "y"), predictor='value', 
    main="Maunga Whau Volcano", 
    color=NULL, col=1, add.color.legend=FALSE)




