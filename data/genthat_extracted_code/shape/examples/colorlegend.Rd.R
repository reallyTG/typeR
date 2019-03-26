library(shape)


### Name: colorlegend
### Title: adds a color legend to a plot.
### Aliases: colorlegend
### Keywords: aplot

### ** Examples

emptyplot(main = "colorlegend")
colorlegend(zlim = c(0, 10))
colorlegend(posx = c(0.8, 0.83), col = greycol(100), 
            zlim = c(0, 1), digit = 1)
colorlegend(posx = c(0.7, 0.73), left = TRUE, col = rainbow(100), 
            zlim = c(0, 10), digit = 1, dz = 2.5)
colorlegend(posx = c(0.5, 0.53), 
            col = intpalette(c("red", "yellow", "black"), 100), 
            zlim = c(0, 20), zval = c(1, 3, 7, 15))
colorlegend(posy = c(0.0, 0.15), posx = c(0.2, 0.3), 
            col = rainbow(100), zlim = c(0, 1), 
            zlevels = NULL, main = "rainbow")
colorlegend(posy = c(0.25, 0.4), posx = c(0.2, 0.3), 
            zlim = c(0, 1), zlevels = NULL, main = "femmecol")
colorlegend(posy = c(0.5, 0.65), posx = c(0.2, 0.3), 
            col = terrain.colors(100), zlim = c(0, 1), 
            zlevels = NULL, main = "terrain.colors")
colorlegend(posy = c(0.75, 0.9), posx = c(0.2, 0.3), 
            col = heat.colors(100), zlim = c(0, 1), 
            zlevels = NULL, main = "heat.colors")



