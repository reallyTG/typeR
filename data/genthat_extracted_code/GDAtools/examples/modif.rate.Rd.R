library(GDAtools)


### Name: modif.rate
### Title: Computes the modified rates of variance of a correspondence
###   analysis
### Aliases: modif.rate
### Keywords: multivariate misc

### ** Examples

## Computes the modified rates of variance
## of the MCA of 'Music' example data set
data(Music)
mca <- speMCA(Music[,1:5])
modif.rate(mca)



