library(OpenImageR)


### Name: translation
### Title: image translation
### Aliases: translation

### ** Examples


path = system.file("tmp_images", "1.png", package = "OpenImageR")

image = readImage(path)

res_tr = translation(image, shift_rows = 10, shift_cols = -10)




