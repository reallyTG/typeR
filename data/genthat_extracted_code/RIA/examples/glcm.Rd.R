library(RIA)


### Name: glcm
### Title: Creates gray-level co-occurrence matrix of RIA image
### Aliases: glcm

### ** Examples

## Not run: 
##D #Discretize loaded image and then calculate GLCM matrix of RIA_image$modif
##D RIA_image <- discretize(RIA_image, bins_in = c(4, 8), equal_prob = TRUE,
##D use_orig = TRUE, write_orig = FALSE)
##D RIA_image <- glcm(RIA_image, use_orig = FALSE, verbose_in = TRUE)
##D 
##D #Use use_slot parameter to set which image to use
##D RIA_image <- glcm(RIA_image, use_orig = FALSE, use_slot = "discretized$ep_4",
##D off_right = 2, off_down = -1, off_z = 0)
##D 
##D #Batch calculation of GLCM matrices on all discretized images
##D RIA_image <- glcm(RIA_image, use_type = "discretized",
##D off_right = 1, off_down = -1, off_z = 0)
## End(Not run)




