library(RIA)


### Name: glrlm_stat
### Title: GLRLM-based statistics
### Aliases: glrlm_stat

### ** Examples

## Not run: 
##D #Discretize loaded image and then calculate GLRLM statistics
##D RIA_image <- discretize(RIA_image, bins_in = 8, equal_prob = TRUE)
##D RIA_image <- glrlm(RIA_image, use_orig = FALSE, use_slot = "discretized$ep_8",
##D right = TRUE, down = TRUE, forward = FALSE)
##D RIA_image <- glrlm_stat(RIA_image, use_orig = FALSE, use_slot = "glrlm$ep_8_110")
##D 
##D #Batch calculation of GLRLM-based statistics on all calculated GLRLMs
##D RIA_image <- glrlm_stat(RIA_image, use_type = "discretized")
## End(Not run)




