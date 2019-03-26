library(countcolors)


### Name: changePixelColor
### Title: Change all specified pixels to a new color
### Aliases: changePixelColor

### ** Examples

# Change a rectangle in the center to black
flowers <- jpeg::readJPEG(system.file("extdata", "flowers.jpg", package =
"countcolors"))

sinister.object <- expand.grid(c(114:314), c(170:470))

countcolors::changePixelColor(flowers, sinister.object, target.color = "black")

## Not run: 
##D # Change all the white flowers to magenta
##D indicator.img <- countcolors::sphericalRange(flowers, center = c(1, 1, 1),
##D radius = 0.1, color.pixels = TRUE, plotting = FALSE)
##D 
##D countcolors::changePixelColor(flowers, indicator.img$pixel.idx,
##D target.color="magenta")
## End(Not run)



