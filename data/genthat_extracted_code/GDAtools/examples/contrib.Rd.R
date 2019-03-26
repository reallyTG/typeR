library(GDAtools)


### Name: contrib
### Title: Computes contributions for a correspondence analysis
### Aliases: contrib
### Keywords: multivariate misc

### ** Examples

## Performs a specific MCA on the 'Music' example data set
## and compute contributions
data(Music)
mca <- speMCA(Music[,1:5],excl=c(3,6,9,12,15))
contrib(mca)



