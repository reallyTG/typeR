library(RIA)


### Name: glrlm
### Title: Creates gray-level run length matrix from RIA image
### Aliases: glrlm

### ** Examples

## Not run: 
##D #Discretize loaded image and then calculate GLRLM matrix of RIA_image$modif
##D RIA_image <- discretize(RIA_image, bins_in = c(4, 8), equal_prob = TRUE,
##D use_orig = TRUE, write_orig = FALSE)
##D RIA_image <- glrlm(RIA_image, use_orig = FALSE, verbose_in = TRUE)
##D 
##D #Use use_slot parameter to set which image to use
##D RIA_image <- glrlm(RIA_image, use_orig = FALSE, use_slot = "discretized$ep_4",
##D off_right = 1, off_down = 1, off_z = 0)
##D 
##D #Batch calculation of GLRLM matrices on all discretized images
##D RIA_image <- glrlm(RIA_image, use_type = "discretized",
##D off_right = 1, off_down = 1, off_z = 0)
## End(Not run)




