library(GDAtools)


### Name: dimcontrib
### Title: Describes the contributions to axes for MCA and variants of MCA
### Aliases: dimcontrib
### Keywords: multivariate misc

### ** Examples

## Performs a specific MCA on 'Music' example data set
## ignoring every 'NA' (i.e. 'not available') categories,
## and then describes the contributions to axes.
data(Music)
getindexcat(Music[,1:5])
mca <- speMCA(Music[,1:5],excl=c(3,6,9,12,15))
dimcontrib(mca)



