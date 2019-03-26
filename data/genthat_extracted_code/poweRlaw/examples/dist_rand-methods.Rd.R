library(poweRlaw)


### Name: dist_rand
### Title: Random number generation for the distribution objects
### Aliases: dist_rand dist_rand,conexp-method dist_rand,conlnorm-method
###   dist_rand,conpl-method dist_rand,conweibull-method
###   dist_rand,disexp-method dist_rand,dislnorm-method
###   dist_rand,displ-method dist_rand,dispois-method

### ** Examples

##########################################
#Create distribution object              #
##########################################
m = displ$new()
m$setXmin(7);m$setPars(2)

##########################################
#Generate five random numbers            #
##########################################
dist_rand(m, 5)



