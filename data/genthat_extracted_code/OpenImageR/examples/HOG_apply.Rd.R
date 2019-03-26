library(OpenImageR)


### Name: HOG_apply
### Title: calculate the HOG (Histogram of oriented gradients) for a
###   matrix, array or a folder of images
### Aliases: HOG_apply

### ** Examples


## Not run: 
##D 
##D MATR = matrix(runif(75), ncol = 25, nrow = 5)
##D 
##D res = HOG_apply(MATR, cells = 3, orientations = 5, rows = 5, columns = 5, threads = 1)
##D 
##D 
##D ARRAY = array(5, dim = c(10, 10, 3))
##D 
##D res = HOG_apply(ARRAY, cells = 3, orientations = 6, threads = 1)
##D 
##D 
##D FOLDER_path = paste0(system.file("tmp_images", "same_type", package = "OpenImageR"), '/')
##D 
##D res = HOG_apply(FOLDER_path, cells = 3, orientations = 6, threads = 1)
## End(Not run)



