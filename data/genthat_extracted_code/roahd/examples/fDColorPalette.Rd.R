library(roahd)


### Name: fDColorPalette
### Title: A set of fancy color to plot functional datasets
### Aliases: fDColorPalette

### ** Examples


N = 1e2
angular_grid = seq( 0, 359, length.out = N )

dev.new()
plot( angular_grid, angular_grid,
      col = fDColorPalette( N, hue_range = c( 0, 359 ), alpha = 1 ),
      pch = 16, cex = 3 )




