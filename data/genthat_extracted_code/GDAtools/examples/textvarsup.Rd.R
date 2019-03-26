library(GDAtools)


### Name: textvarsup
### Title: Adds a categorical supplementary variable to a MCA graph
### Aliases: textvarsup
### Keywords: aplot multivariate

### ** Examples

## Performs a specific MCA on 'Music' example data set
## ignoring every 'NA' (i.e. 'not available') categories,
## plots the cloud of categories,
## and then adds gender and age supplementary categories.
data(Music)
getindexcat(Music)
mca <- speMCA(Music[,1:5],excl=c(3,6,9,12,15))
plot(mca,col='gray')
textvarsup(mca,Music$Gender,col='darkred')
textvarsup(mca,Music$Age,sel=c(1,3),col='orange',vname='age',app=1)



