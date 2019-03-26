library(GDAtools)


### Name: varsup
### Title: Computes statistics for a categorical supplementary variable
### Aliases: varsup
### Keywords: multivariate misc

### ** Examples

## Performs a specific MCA on 'Music' example data set
## ignoring every 'NA' (i.e. 'not available') categories,
## and then computes statistics for age supplementary variable.
data(Music)
getindexcat(Music)
mca <- speMCA(Music[,1:5],excl=c(3,6,9,12,15))
varsup(mca,Music$Age)



