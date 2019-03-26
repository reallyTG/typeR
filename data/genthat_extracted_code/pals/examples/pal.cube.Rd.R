library(pals)


### Name: pal.cube
### Title: Show one palette/colormap in three dimensional RGB or LUV space
### Aliases: pal.cube

### ** Examples

## Not run: 
##D pal.cube(cubehelix)
##D pal.cube(glasbey, n=32) # RGB, blues are too close to each other
##D pal.cube(glasbey, n=32, type="LUV")
##D pal.cube(cols25(25), type="LUV", label=TRUE)
##D # To open a second cube
##D rgl.open() # Open a new RGL device
##D rgl.bg(color = "white") # Setup the background color
##D pal.cube(colors()[c(1:152, 254:260, 362:657)]) # All R non-grey colors
## End(Not run)




