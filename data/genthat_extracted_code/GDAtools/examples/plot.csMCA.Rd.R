library(GDAtools)


### Name: plot.csMCA
### Title: Plots 'class specific' MCA results
### Aliases: plot.csMCA
### Keywords: aplot multivariate

### ** Examples

## Performs a class specific MCA on 'Music' example data set
## ignoring every 'NA' (i.e. 'not available') categories 
## and focusing on the subset of women,
## and then draws the cloud of categories.
data(Music)
female <- Music$Gender=='Women'
getindexcat(Music[,1:5])
mca <- csMCA(Music[,1:5],subcloud=female,excl=c(3,6,9,12,15))
plot(mca)
plot(mca,axes=c(2,3),points='best',col='darkred',app=1)



