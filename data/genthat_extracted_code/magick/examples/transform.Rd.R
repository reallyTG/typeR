library(magick)


### Name: transform
### Title: Image Transform
### Aliases: transform image_trim image_chop image_rotate image_resize
###   image_scale image_sample image_crop image_flip image_flop
###   image_deskew image_page image_repage image_orient

### ** Examples

logo <- image_read("logo:")
logo <- image_scale(logo, "400")
image_trim(logo)
image_chop(logo, "100x20")
image_rotate(logo, 45)
# Small image
rose <- image_convert(image_read("rose:"), "png")

# Resize to 400 width or height:
image_resize(rose, "400x")
image_resize(rose, "x400")

# Resize keeping ratio
image_resize(rose, "400x400")

# Resize, force size losing ratio
image_resize(rose, "400x400!")

# Different filters
image_resize(rose, "400x", filter = "Triangle")
image_resize(rose, "400x", filter = "Point")
# simple pixel resize
image_scale(rose, "400x")
image_sample(rose, "400x")
image_crop(logo, "400x400+200+200")
image_flip(logo)
image_flop(logo)
if(magick_config()$version > "6.8.6")
  image_orient(logo)



