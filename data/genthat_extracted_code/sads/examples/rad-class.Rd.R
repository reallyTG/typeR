library(sads)


### Name: rad-class
### Title: Class '"rad"' for rank-abundance data
### Aliases: rad-class lines,rad-method plot,rad-method plot,rad,ANY-method
###   points,rad-method
### Keywords: classes

### ** Examples

## Creates a rad object from a vector of abundances
birds.rad <- rad(birds)

## Rank-abundance plot
plot(birds.rad)

## Same, with non-default graphical parameters
plot(birds.rad, pch=19, xlab="Abundance rank of species")

## Adding points from another data set
points(rad(okland), pch=19)



