library(RIA)


### Name: first_order
### Title: Calculates first-order statistical metrics for RIA_image
### Aliases: first_order

### ** Examples

## Not run: 
##D #Calculate first-order statistics on original data
##D RIA_image <- first_order(RIA_image, use_orig = TRUE)
##D 
##D #Dichotomize loaded image and then calculate first order statistics
##D on it and save results into the RIA_image
##D RIA_image <- dichotomize(RIA_image, bins_in = c(4, 8), equal_prob = TRUE,
##D use_orig = TRUE, write_orig = FALSE)
##D RIA_image <- first_order(RIA_image, use_orig = FALSE, verbose_in = TRUE)
##D 
##D #Use use_slot parameter to set which image to use
##D RIA_image <- first_order(RIA_image, use_orig = FALSE, use_slot = "discretized$ep_4")
##D 
##D #Batch calculation of first-order statistics on all discretized images
##D RIA_image <- first_order(RIA_image, use_type = "discretized")
## End(Not run)




