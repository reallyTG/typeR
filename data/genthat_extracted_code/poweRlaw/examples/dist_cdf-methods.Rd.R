library(poweRlaw)


### Name: dist_cdf
### Title: The cumulative distribution function (cdf)
### Aliases: dist_cdf dist_cdf,conexp-method dist_all_cdf,conexp-method
###   dist_all_cdf,conexo-method dist_cdf,conlnorm-method
###   dist_all_cdf,conlnorm-method dist_cdf,conpl-method
###   dist_all_cdf,conpl-method dist_cdf,conweibull-method
###   dist_all_cdf,conweibull-method dist_cdf,disexp-method
###   dist_all_cdf,disexp-method dist_cdf,dislnorm-method
###   dist_all_cdf,dislnorm-method dist_cdf,displ-method
###   dist_all_cdf,displ-method dist_cdf,dispois-method
###   dist_all_cdf,dispois-method

### ** Examples

##########################################
#Load data and create distribution object#
##########################################
data(moby_sample)
m = displ$new(moby_sample)
m$setXmin(7); m$setPars(2)

##########################################
#Calculate the CDF at a particular values#
##########################################
dist_cdf(m, 10:15)

########################################## 
#Calculate the CDF at the data values    #
##########################################
dist_cdf(m)



