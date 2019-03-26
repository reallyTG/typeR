library(RIA)


### Name: glrlm_stat_all
### Title: Aggregates GLRLM-based statistics based-on supplied function
### Aliases: glrlm_stat_all

### ** Examples

## Not run: 
##D #Discretize loaded image and then calculate GLCM statistics for all matrices
##D RIA_image <- discretize(RIA_image, bins_in = c(4, 8), equal_prob = TRUE,
##D use_orig = TRUE, write_orig = FALSE)
##D RIA_image <- glrlm_all(RIA_image, use_type = "discretized")
##D RIA_image <- glrlm_stat(RIA_image)
##D 
##D #Calculate the average of the different GLCM matrices in the different directions
##D RIA_image <- glrlm_stat_all(RIA_image)
## End(Not run)




