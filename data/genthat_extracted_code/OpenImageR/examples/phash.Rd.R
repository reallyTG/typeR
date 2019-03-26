library(OpenImageR)


### Name: phash
### Title: calculation of the 'phash' of an image
### Aliases: phash

### ** Examples


image = readImage(system.file("tmp_images", "2.jpg", package = "OpenImageR"))

image = rgb_2gray(image)

res_hash = phash(image, hash_size = 6, highfreq_factor = 3, MODE = 'hash')

res_binary = phash(image, hash_size = 6, highfreq_factor = 3, MODE = 'binary')




