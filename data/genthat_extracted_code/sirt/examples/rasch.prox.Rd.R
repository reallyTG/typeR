library(sirt)


### Name: rasch.prox
### Title: PROX Estimation Method for the Rasch Model
### Aliases: rasch.prox
### Keywords: PROX algorithm

### ** Examples

#############################################################################
# EXAMPLE 1: PROX data.read
#############################################################################

data(data.read)
mod <- sirt::rasch.prox( data.read )
mod$b       # item difficulties



