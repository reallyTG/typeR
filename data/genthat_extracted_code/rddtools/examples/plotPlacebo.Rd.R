library(rddtools)


### Name: plotPlacebo
### Title: Draw a (density) plot of placebo tests
### Aliases: computePlacebo plotPlacebo plotPlacebo.rdd_reg plotPlaceboDens
###   plotPlaceboDens.rdd_reg

### ** Examples

data(house)
house_rdd <- rdd_data(y=house$y, x=house$x, cutpoint=0)
reg_nonpara <- rdd_reg_np(rdd_object=house_rdd)
plotPlacebo(reg_nonpara)

# Use with another vcov function; cluster case
reg_nonpara_lminf <- rdd_reg_np(rdd_object=house_rdd, inference='lm')
# need to be a function applied to updated object!
vc <- function(x) vcovCluster(x, clusterVar=model.frame(x)$x)
plotPlacebo(reg_nonpara_lminf, vcov. = vc)



