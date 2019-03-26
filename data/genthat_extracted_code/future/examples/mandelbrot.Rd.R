library(future)


### Name: mandelbrot
### Title: Mandelbrot convergence counts
### Aliases: mandelbrot as.raster.Mandelbrot plot.Mandelbrot
###   mandelbrot_tiles
### Keywords: internal

### ** Examples

counts <- mandelbrot(xmid = -0.75, ymid = 0, side = 3)
str(counts)
## Not run: 
##D plot(counts)
## End(Not run)

## Not run: 
##D demo("mandelbrot", package = "future", ask = FALSE)
## End(Not run)




