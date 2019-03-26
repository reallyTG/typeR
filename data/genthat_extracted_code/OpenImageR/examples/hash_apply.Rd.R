library(OpenImageR)


### Name: hash_apply
### Title: calculate the binary or the hexadecimal hash for a matrix, array
###   or a folder of images for the average_hash, phash or dhash functions
### Aliases: hash_apply

### ** Examples


path = paste0(system.file("tmp_images", "same_type", package = "OpenImageR"), '/')

res_phash = hash_apply(path, method = 'phash', mode = 'binary')




