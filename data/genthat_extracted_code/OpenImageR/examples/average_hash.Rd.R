library(OpenImageR)


### Name: average_hash
### Title: calculation of the 'average hash' of an image
### Aliases: average_hash

### ** Examples


image = readImage(system.file("tmp_images", "1.png", package = "OpenImageR"))

image = rgb_2gray(image)

res_hash = average_hash(image, hash_size = 8, MODE = 'hash')

res_binary = average_hash(image, hash_size = 8, MODE = 'binary')




