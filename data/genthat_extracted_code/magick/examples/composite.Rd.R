library(magick)


### Name: composite
### Title: Image Composite
### Aliases: composite image_composite image_border image_frame

### ** Examples

# Compose images using one of many operators
imlogo <- image_scale(image_read("logo:"), "x275")
rlogo <- image_read("https://developer.r-project.org/Logo/Rlogo-3.png")

# Standard is atop
image_composite(imlogo, rlogo)

# Same as 'blend 50' in the command line
image_composite(imlogo, rlogo, operator = "blend", compose_args="50")

# Add a border frame around the image
image_border(imlogo, "red", "10x10")
image_frame(imlogo)



