library(shinyaframe)


### Name: aframetags
### Title: A-Frame Custom Elements
### Aliases: aframeAssets aframeBox aframeEntity aframeMixin
###   aframePrimitive aframeScene aframeSphere aframetags atags
### Keywords: datasets

### ** Examples

# Construct A-Frame HTML syntax for a 3D scene with a red box and blue sky
atags$scene(
  atags$box(color = "red", position = "0 0.5 -3"),
  atags$other("sky", color = "#89b6ff")
)




