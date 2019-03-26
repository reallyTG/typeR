library(GDAtools)


### Name: prop.wtable
### Title: Transforms a (possibly weighted) contingency table into
###   percentages
### Aliases: prop.wtable
### Keywords: multivariate misc

### ** Examples

## Computes a contingency table
## (expressed in percentages)
## of jazz and age variables
## from the 'Music' example data set
## with or without weights
data(Music)
prop.wtable(Music$Jazz)
prop.wtable(Music$Jazz,Music$Gender)
prop.wtable(Music$Jazz,Music$Gender,dir=1)
prop.wtable(Music$Jazz,Music$Gender,dir=2)

weight <- sample(0:20,nrow(Music),TRUE)/10
prop.wtable(Music$Jazz,w=weight)
prop.wtable(Music$Jazz,Music$Age,weight)
prop.wtable(Music$Jazz,Music$Age,weight,dir=1)
prop.wtable(Music$Jazz,Music$Age,weight,dir=2)



