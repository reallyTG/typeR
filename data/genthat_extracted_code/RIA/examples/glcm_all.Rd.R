library(RIA)


### Name: glcm_all
### Title: Creates gray-level co-occurrence matrix of all possible
###   directions of a RIA image
### Aliases: glcm_all

### ** Examples

## Not run: 
##D #Discretize loaded image and then calculate GLCM matrix of RIA_image$modif
##D RIA_image <- discretize(RIA_image, bins_in = c(4, 8), equal_prob = TRUE,
##D use_orig = TRUE, write_orig = FALSE)
##D RIA_image <- glcm_all(RIA_image, use_type = "single")
##D 
##D #Use use_slot parameter to set which image to use
##D RIA_image <- glcm_all(RIA_image, use_type = "single",
##D use_orig = FALSE, use_slot = "discretized$ep_4")
##D 
##D #Batch calculation of GLCM matrices on all disretized images at a distance of 1 and 2
##D RIA_image <- glcm_all(RIA_image, use_type = "discretized", distance = c(1:2))
## End(Not run)




