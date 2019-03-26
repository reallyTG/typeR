library(insurancerating)


### Name: biggest_reference
### Title: Set reference group to the group with largest exposure
### Aliases: biggest_reference

### ** Examples

## Not run: 
##D library(dplyr)
##D df <- chickwts %>%
##D mutate_if(is.character, as.factor) %>%
##D mutate_if(is.factor, funs(biggest_reference(., weight)))
## End(Not run)



