library(colorfindr)


### Name: make_palette
### Title: Create a color palette from an image.
### Aliases: make_palette

### ** Examples

# Create palette from image
img <- system.file("extdata", "pic6.png", package = "colorfindr")
colors <- get_colors(img)
make_palette(colors)




