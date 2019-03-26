library(GDAtools)


### Name: plot.stMCA
### Title: Plots 'standardized' MCA results
### Aliases: plot.stMCA
### Keywords: aplot multivariate

### ** Examples

## Performs a standardized MCA on 'Music' example data set
## ignoring every 'NA' (i.e. 'not available') categories 
## and controlling for age,
## and then draws the cloud of categories.
data(Music)
mca <- speMCA(Music[,1:5],excl=c(3,6,9,12,15))
stmca <- stMCA(mca,control=list(Music$Age))
plot(stmca)
plot(stmca,axes=c(2,3),points='best',col='darkred',app=1)



