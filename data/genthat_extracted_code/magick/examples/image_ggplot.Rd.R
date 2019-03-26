library(magick)


### Name: image_ggplot
### Title: Image to ggplot
### Aliases: image_ggplot

### ** Examples

# Plot with base R
plot(logo)

# Plot image with ggplot2
library(ggplot2)
myplot <- image_ggplot(logo)
myplot + ggtitle("Test plot")

# Or add to plot as annotation
image <- image_fill(logo, 'none')
raster <- as.raster(image)
myplot <- qplot(mpg, wt, data = mtcars)
myplot + annotation_raster(raster, 25, 35, 3, 5)

# Or overplot image using grid
library(grid)
qplot(speed, dist, data = cars, geom = c("point", "smooth"))
grid.raster(image)



