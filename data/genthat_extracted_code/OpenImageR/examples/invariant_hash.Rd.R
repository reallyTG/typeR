library(OpenImageR)


### Name: invariant_hash
### Title: invariant hashing (caclulation of the hamming or the levenshtein
###   distance when the image is flipped, rotated or cropped)
### Aliases: invariant_hash

### ** Examples


## Not run: 
##D 
##D path1 = system.file("tmp_images", "1.png", package = "OpenImageR")
##D 
##D path2 = system.file("tmp_images", "2.jpg", package = "OpenImageR")
##D 
##D image1 = rgb_2gray(readImage(path1))
##D 
##D image2 = rgb_2gray(readImage(path2))
##D 
##D res1 = invariant_hash(image1, image2, hash_size = 3, flip = TRUE, crop = FALSE)
##D 
##D res2 = invariant_hash(image1, image2, mode = 'hash', hash_size = 3, angle_bidirectional = 10)
## End(Not run)



