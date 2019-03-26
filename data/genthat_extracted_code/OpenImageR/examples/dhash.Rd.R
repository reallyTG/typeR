library(OpenImageR)


### Name: dhash
### Title: calculation of the 'dhash' of an image
### Aliases: dhash

### ** Examples


image = readImage(system.file("tmp_images", "3.jpeg", package = "OpenImageR"))

image = rgb_2gray(image)

res_hash = dhash(image, hash_size = 8, MODE = 'hash')

res_binary = dhash(image, hash_size = 8, MODE = 'binary')




