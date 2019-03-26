library(GDAtools)


### Name: dimdesc.MCA
### Title: Describes the dimensions of MCA and variants of MCA
### Aliases: dimdesc.MCA
### Keywords: multivariate misc

### ** Examples

## Performs a specific MCA on 'Music' example data set
## ignoring every 'NA' (i.e. 'not available') categories,
## and then describe the dimensions.
data(Music)
getindexcat(Music[,1:5])
mca <- speMCA(Music[,1:5],excl=c(3,6,9,12,15))
dimdesc.MCA(mca,proba=0.2)



