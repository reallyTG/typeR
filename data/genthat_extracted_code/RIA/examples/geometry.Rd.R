library(RIA)


### Name: geometry
### Title: Calculates geometry-based parameters of RIA image
### Aliases: geometry

### ** Examples

## Not run: 
##D #Calculate geometry-based parameters on original image
##D RIA_image <- geometry(RIA_image, use_orig = TRUE, calc_sub = FALSE)
##D 
##D #Discretize loaded image and then calculate geometry-based statistics on subcomponents
##D RIA_image <- discretize(RIA_image, bins_in = c(4,8), equal_prob = TRUE, use_orig = TRUE)
##D RIA_image <- geometry(RIA_image, use_orig = FALSE, calc_sub = TRUE)
##D 
##D #Use use_slot parameter to set which image to use
##D RIA_image <- geometry(RIA_image, use_orig = FALSE, calc_sub = TRUE, use_slot = "discretized$ep_4")
##D 
##D #Batch calculation of geometry-based statistics on all discretized images and subcomponents
##D RIA_image <- geometry(RIA_image, use_type = "discretized", calc_sub = TRUE)
## End(Not run)





