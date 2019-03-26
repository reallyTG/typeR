library(submax)


### Name: submax
### Title: Effect Modification Using the Submax Method in Observational
###   Studies
### Aliases: submax
### Keywords: htest robust

### ** Examples

# Reproduces parts of Table 2 of Lee et al. (2017).
data(Active)
submax(Active$delta,Active[,1:7],gamma=1.77,alternative="less",fast=TRUE)
amplify(1.77,c(2,3,4))

# Reproduces the closed-testing analysis in
#Section 4 of Lee et al. (2017)
submax(Active$delta,Active[,c(3,5)],gamma=1.4,alternative="less",fast=TRUE)

# See also the examples for the score() function.



