library(sirt)


### Name: wle.rasch
### Title: Weighted Likelihood Estimation of Person Abilities
### Aliases: wle.rasch
### Keywords: Weighted likelihood estimation (WLE) Person parameter
###   estimation

### ** Examples

#############################################################################
# EXAMPLE 1: Dataset Reading
#############################################################################
data(data.read)

# estimate the Rasch model
mod <- sirt::rasch.mml2(data.read)
mod$item

# estmate WLEs
mod.wle <- sirt::wle.rasch( dat=data.read, b=mod$item$b )



