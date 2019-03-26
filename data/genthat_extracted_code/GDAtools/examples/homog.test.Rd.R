library(GDAtools)


### Name: homog.test
### Title: Computes a homogeneity test for a categorical supplementary
###   variable
### Aliases: homog.test
### Keywords: multivariate misc

### ** Examples

## Performs a specific MCA on 'Music' example data set
## ignoring every 'NA' (i.e. 'not available') categories,
## and then computes a homogeneity test for age supplementary variable.
data(Music)
getindexcat(Music)
mca <- speMCA(Music[,1:5],excl=c(3,6,9,12,15))
homog.test(mca,Music$Age)



