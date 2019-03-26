library(magick)


### Name: geometry
### Title: Geometry Helpers
### Aliases: geometry geometry_point geometry_area geometry_size_pixels
###   geometry_size_percent

### ** Examples

# Specify a point
logo <- image_read("logo:")
image_annotate(logo, "Some text", location = geometry_point(100, 200), size = 24)

# Specify image area
image_crop(logo, geometry_area(300, 300), repage = FALSE)
image_crop(logo, geometry_area(300, 300, 100, 100), repage = FALSE)

# Specify image size
image_resize(logo, geometry_size_pixels(300))
image_resize(logo, geometry_size_pixels(height = 300))
image_resize(logo, geometry_size_pixels(300, 300, preserve_aspect = FALSE))

# resize relative to current size
image_resize(logo, geometry_size_percent(50))
image_resize(logo, geometry_size_percent(50, 20))




