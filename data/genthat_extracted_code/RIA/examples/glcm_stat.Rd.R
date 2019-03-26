library(RIA)


### Name: glcm_stat
### Title: Calculates GLCM-based statistics
### Aliases: glcm_stat

### ** Examples

## Not run: 
##D #Discretize loaded image and then calculate GLCM statistics
##D RIA_image <- discretize(RIA_image, bins_in = 8, equal_prob = TRUE)
##D RIA_image <- glcm(RIA_image, use_orig = FALSE, use_slot = "discretized$ep_8",
##D off_right = 0, off_down = 1, off_z = 0)
##D RIA_image <- glcm_stat(RIA_image, use_orig = FALSE, use_slot = "glcm$ep_8_010")
##D 
##D #Batch calculation of GLCM-based statistics on all calculated GLCMs
##D RIA_image <- glcm_stat(RIA_image, use_type = "discretized")
## End(Not run)




