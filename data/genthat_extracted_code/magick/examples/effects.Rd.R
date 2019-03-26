library(magick)


### Name: effects
### Title: Image Effects
### Aliases: effects image_despeckle image_reducenoise image_noise
###   image_blur image_charcoal image_oilpaint image_emboss image_implode
###   image_negate

### ** Examples

logo <- image_read("logo:")
image_despeckle(logo)
image_reducenoise(logo)
image_noise(logo)
image_blur(logo, 10, 10)
image_charcoal(logo)
image_oilpaint(logo, radius = 3)
image_emboss(logo)
image_implode(logo)
image_negate(logo)



