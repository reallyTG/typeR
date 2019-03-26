library(GDAtools)


### Name: multiMCA
### Title: Performs Multiple Factor Analysis
### Aliases: multiMCA
### Keywords: multivariate

### ** Examples

## Performs a specific MCA on music variables of 'Taste' example data set,
## another one on movie variables of 'Taste' example data set, 
## and then a Multiple Factor Analysis.
data(Taste)
getindexcat(Taste[,1:5])
mca1 <- speMCA(Taste[,1:5],excl=c(3,6,9,12,15))
getindexcat(Taste[,6:11])
mca2 <- speMCA(Taste[,6:11],excl=c(3,6,9,12,15,18))
mfa <- multiMCA(list(mca1,mca2))
plot.multiMCA(mfa)



