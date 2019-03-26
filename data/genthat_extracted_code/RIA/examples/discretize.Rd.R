library(RIA)


### Name: discretize
### Title: Discretizes RIA image to a given number of bins
### Aliases: discretize

### ** Examples

## Not run: 
##D #Discretize into 8 bins, each containing equal number of elements
##D RIA_image <- discretize(RIA_image, bins_in = 8, equal_prob = TRUE,
##D  use_orig = TRUE, write_orig = FALSE)
##D 
##D #Discretize into 6 bins, each with the same width
##D RIA_image <- discretize(RIA_image, bins_in = 6, equal_prob = FALSE,
##D  use_orig = TRUE, write_orig = FALSE)
##D 
##D #Discretize into 2,4,8,16,32 bins, each containing equal number of elements
##D RIA_image <- discretize(RIA_image, bins_in = 2^(1:5), equal_prob = FALSE,
##D  use_orig = TRUE, write_orig = FALSE)
##D  
##D #D
## End(Not run)




