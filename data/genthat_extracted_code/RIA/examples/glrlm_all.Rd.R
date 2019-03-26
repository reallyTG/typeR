library(RIA)


### Name: glrlm_all
### Title: Creates gray-level run length matrix of all possible directions
###   of a RIA image
### Aliases: glrlm_all

### ** Examples

## Not run: 
##D #Discretize loaded image and then calculate GLRLM matrix of RIA_image$modif
##D RIA_image <- discretize(RIA_image, bins_in = c(4, 8), equal_prob = TRUE,
##D use_orig = TRUE, write_orig = FALSE)
##D RIA_image <- glrlm_all(RIA_image, use_type = "single")
##D 
##D #Use use_slot parameter to set which image to use
##D RIA_image <- glrlm_all(RIA_image, use_type = "single",
##D use_orig = FALSE, use_slot = "discretized$ep_4")
##D 
##D #Batch calculation of GLCM matrices on all disretized images
##D RIA_image <- glrlm_all(RIA_image)
## End(Not run)



