library(poweRlaw)


### Name: conexp-class
### Title: Heavy-tailed distributions
### Aliases: conexp-class conexp conlnorm-class conlnorm conpl-class conpl
###   conweibull-class conweibull disexp-class disexp dislnorm-class
###   dislnorm displ-class displ dispois-class dispois

### ** Examples

##############################################################
#Load data and create distribution object                    #
##############################################################
data(moby)
m = displ$new(moby)

##############################################################
#Xmin is initially the smallest x value                      #
##############################################################
m$getXmin()
m$getPars()

##############################################################
#Set Xmin and parameter                                      #
##############################################################
m$setXmin(2)
m$setPars(2)


##############################################################
#Plot the data and fitted distribution                       #
##############################################################
plot(m)
lines(m)
##############################################################
#Copying                                                     #
##############################################################
## Shallow copy
m_cpy = m
m_cpy$setXmin(5)
m$getXmin()
## Instead
m_cpy = m$copy()



