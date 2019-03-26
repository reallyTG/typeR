library(GDAtools)


### Name: dimeta2
### Title: Describes the eta2 of a list of supplementary variables for the
###   axes of MCA and variants of MCA
### Aliases: dimeta2
### Keywords: multivariate misc

### ** Examples

## Performs a specific MCA on 'Music' example data set
## ignoring every 'NA' (i.e. 'not available') categories,
## and then describes the eta2 for Gender and Age (axes 1 and 2).
data(Music)
getindexcat(Music[,1:5])
mca <- speMCA(Music[,1:5],excl=c(3,6,9,12,15))
dimeta2(mca,list(Music$Gender,Music$Age),c('Gender','Age'),dim=1:2)



