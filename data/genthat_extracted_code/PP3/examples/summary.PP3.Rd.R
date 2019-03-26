library(PP3)


### Name: summary.PP3
### Title: Print summary information about a PP3 object.
### Aliases: summary.PP3
### Keywords: multivariate

### ** Examples

#
# The flea beetle data
#
data(beetle)
#
# Run projection pursuit with 10 random starts (usually MUCH more than this,
# but this example will be run on installation and testing and hence I
# want to minimize computational load. A more reasonable value is 1000)
#
beetle.PP3 <- PP3many(t(beetle), nrandstarts=10)
#
# Output from summary
#
summary(beetle.PP3)
#Summary statistics of projection index
#   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#  13.84   15.36   17.50   17.30   19.08   20.39 
#Summary statistics of pseudo p-values
#   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#  11.14   11.78   12.77   13.59   15.31   17.63 



