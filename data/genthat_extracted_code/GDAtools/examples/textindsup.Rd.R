library(GDAtools)


### Name: textindsup
### Title: Adds supplementary individuals to a MCA graph
### Aliases: textindsup
### Keywords: aplot multivariate

### ** Examples

## Performs a specific MCA on 'Music' example data set
## ignoring every 'NA' (i.e. 'not available') categories,
## plots the cloud of individuals,
## and then adds supplementary individuals.
data(Music)
getindexcat(Music)
mca <- speMCA(Music[3:nrow(Music),1:5],excl=c(3,6,9,12,15))
plot(mca,type='i')
textindsup(mca,Music[1:2,1:5])



