library(GDAtools)


### Name: plot.speMCA
### Title: Plots 'specific' MCA results
### Aliases: plot.speMCA
### Keywords: aplot multivariate

### ** Examples

## Performs a specific MCA on 'Music' example data set
## ignoring every 'NA' (i.e. 'not available') categories,
## and then draws the cloud of categories.
data(Music)
getindexcat(Music[,1:5])
mca <- speMCA(Music[,1:5],excl=c(3,6,9,12,15))
plot(mca)
plot(mca,axes=c(2,3),points='best',col='darkred',app=1)



