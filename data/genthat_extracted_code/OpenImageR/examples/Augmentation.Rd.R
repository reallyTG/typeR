library(OpenImageR)


### Name: Augmentation
### Title: image augmentations of a matrix, data frame, array or a list of
###   3-dimensional arrays
### Aliases: Augmentation

### ** Examples


## Not run: 
##D 
##D # a matrix
##D object = matrix(1, 10, 10)
##D 
##D res = Augmentation(object, resiz_width = 8, resiz_height = 8, rotate_angle = 40)
##D 
##D 
##D # an array
##D object = array(0, dim = c(10, 10, 3))
##D 
##D res = Augmentation(object, resiz_width = 8, resiz_height = 8, rotate_angle = 30)
##D 
##D 
##D # an array (multiple matrices)
##D object = array(0, dim = c(10, 10, 10))
##D 
##D res = Augmentation(object, resiz_width = 8, resiz_height = 8, rotate_angle = 20)
##D 
##D 
##D # a list of 3-dimensional arrays
##D object = list(array(0, dim = c(10, 10, 3)), array(0, dim = c(10, 10, 3)))                
##D 
##D res = Augmentation(object, resiz_width = 8, resiz_height = 8, rotate_angle = 40)
## End(Not run)



