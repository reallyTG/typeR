library(GDAtools)


### Name: indsup
### Title: Computes statistics for supplementary individuals
### Aliases: indsup
### Keywords: multivariate misc

### ** Examples

## Performs a specific MCA on 'Music' example data set
## ignoring every 'NA' (i.e. 'not available') categories,
## and then computes statistics for supplementary individuals.
data(Music)
getindexcat(Music)
mca <- speMCA(Music[3:nrow(Music),1:5],excl=c(3,6,9,12,15))
indsup(mca,Music[1:2,1:5])



