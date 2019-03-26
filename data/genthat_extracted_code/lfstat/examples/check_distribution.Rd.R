library(lfstat)


### Name: check_distribution
### Title: Checks if a Distribution is suited
### Aliases: check_distribution
### Keywords: low-flow distribution

### ** Examples

# Using the Weibull distribution for minimum values is a good choice
check_distribution(extreme = "minimum", distribution = "wei")

# ... whereas the GEV is meant for maxima.
# Therefore the reversed distribution is suggested.
check_distribution(extreme = "minimum", distribution = "gev")



