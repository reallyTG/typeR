library(RIA)


### Name: glcm_stat_all
### Title: Aggregates GLCM-based statistics based-on supplied function
### Aliases: glcm_stat_all

### ** Examples

## Not run: 
##D #Discretize loaded image and then calculate GLCM statistics for all matrices
##D RIA_image <- discretize(RIA_image, bins_in = c(4, 8), equal_prob = TRUE,
##D use_orig = TRUE, write_orig = FALSE)
##D RIA_image <- glcm_all(RIA_image, use_type = "discretized", distance = c(1:2))
##D RIA_image <- glcm_stat(RIA_image)
##D 
##D #Calculate the average of the different GLCM matrices in the different directions
##D RIA_image <- glcm_stat_all(RIA_image)
## End(Not run)




