library(GDAtools)


### Name: speMCA
### Title: Performs a 'specific' MCA
### Aliases: speMCA
### Keywords: multivariate

### ** Examples

## Performs a specific MCA on 'Music' example data set
## ignoring every 'NA' (i.e. 'not available') categories.
data(Music)
getindexcat(Music[,1:5])
mca <- speMCA(Music[,1:5],excl=c(3,6,9,12,15))
str(mca)



