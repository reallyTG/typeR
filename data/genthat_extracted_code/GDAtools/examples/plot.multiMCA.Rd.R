library(GDAtools)


### Name: plot.multiMCA
### Title: Plots Multiple Factor Analysis
### Aliases: plot.multiMCA
### Keywords: aplot multivariate

### ** Examples

## Performs a specific MCA on music variables of 'Taste' example data set,
## another one on movie variables of 'Taste' example data set, 
## and then a Multiple Factor Analysis and plots the results.
data(Taste)
mca1 <- speMCA(Taste[,1:5],excl=c(3,6,9,12,15))
mca2 <- speMCA(Taste[,6:11],excl=c(3,6,9,12,15,18))
mfa <- multiMCA(list(mca1,mca2))
plot.multiMCA(mfa,col=c('darkred','darkblue'))
plot.multiMCA(mfa,groups=2,app=1)



