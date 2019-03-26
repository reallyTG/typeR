library(colorfindr)


### Name: get_colors
### Title: Extract colors from images.
### Aliases: get_colors

### ** Examples

# Extract all colors
pic1 <- system.file("extdata", "pic1.png", package = "colorfindr")
get_colors(pic1)

# Extract three most frequent colors
pic2 <- system.file("extdata", "pic2.tif", package = "colorfindr")
get_colors(pic2, top_n = 3)

# Extract colors that fill over 20% of the area
pic3 <- system.file("extdata", "pic3.jpg", package = "colorfindr")
get_colors(pic3, min_share = 0.2)

# Extract all colors except white
pic4 <- system.file("extdata", "pic4.bmp", package = "colorfindr")
get_colors(pic4, exclude_col = "white")




