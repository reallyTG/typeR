library(SWMPr)


### Name: rem_reps
### Title: Remove replicates in nutrient data
### Aliases: rem_reps rem_reps.swmpr

### ** Examples

## get nutrient data
data(apacpnut)
swmp1 <- apacpnut

# remove replicate nutrient data
rem_reps(swmp1)

# use different function to aggregate replicates
func <- function(x) max(x, na.rm = TRUE)
rem_reps(swmp1, FUN = func)



