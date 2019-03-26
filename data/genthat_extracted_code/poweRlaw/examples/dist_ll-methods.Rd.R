library(poweRlaw)


### Name: dist_ll
### Title: The log-likelihood function
### Aliases: dist_ll dist_ll,conexp-method dist_ll,conlnorm-method
###   dist_ll,conpl-method dist_ll,conweibull-method dist_ll,disexp-method
###   dist_ll,dislnorm-method dist_ll,displ-method dist_ll,dispois-method

### ** Examples

##########################################
#Load data and create distribution object#
##########################################
data(moby_sample)
m = displ$new(moby_sample)
m$setXmin(7); m$setPars(2)

##########################################
#Calculate the log-likelihood            #
##########################################
dist_ll(m)



