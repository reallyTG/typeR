library(OpenImageR)


### Name: cropImage
### Title: crop an image
### Aliases: cropImage

### ** Examples


path = system.file("tmp_images", "2.jpg", package = "OpenImageR")

image = readImage(path)

# IF 'equal_spaced':
crop1 = cropImage(image, new_width = 20, new_height = 20, type = 'equal_spaced')

# IF 'user_defined':
crop2 = cropImage(image, new_width = 5:20, new_height = 5:20, type = 'user_defined')




