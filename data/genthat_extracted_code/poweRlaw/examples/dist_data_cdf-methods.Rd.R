library(poweRlaw)


### Name: dist_all_cdf
### Title: The data cumulative distribution function
### Aliases: dist_all_cdf dist_data_cdf dist_data_all_cdf
###   dist_data_cdf,discrete_distribution-method
###   dist_data_all_cdf,discrete_distribution-method
###   dist_data_cdf,ctn_distribution-method

### ** Examples

##########################################
#Load data and create distribution object#
##########################################
data(moby_sample)
m = displ$new(moby_sample)
m$setXmin(7);m$setPars(2)

##########################################
# The data cdf                           #
##########################################
dist_data_cdf(m)



