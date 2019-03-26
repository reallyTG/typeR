library(BSDA)


### Name: Fish
### Title: Length and number of fish caught with small and large mesh
###   codend
### Aliases: Fish
### Keywords: datasets

### ** Examples


tapply(Fish$length, Fish$codend, median, na.rm = TRUE)
SIGN.test(Fish$length[Fish$codend == "smallmesh"], conf.level = 0.99)
## Not run: 
##D dplyr::group_by(Fish, codend) %>%
##D          summarize(MEDIAN = median(length, na.rm = TRUE))
## End(Not run)




