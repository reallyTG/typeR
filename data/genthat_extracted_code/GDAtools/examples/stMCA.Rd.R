library(GDAtools)


### Name: stMCA
### Title: Performs a 'standardized' MCA
### Aliases: stMCA
### Keywords: multivariate

### ** Examples

## Performs a specific MCA on 'Music' example data set
## ignoring every 'NA' (i.e. 'not available') categories,
## and then performs a 'standardized' MCA controlling for age.
data(Music)
mca <- speMCA(Music[,1:5],excl=c(3,6,9,12,15))
plot(mca)
textvarsup(mca,Music$Age,col='red')
stmca <- stMCA(mca,control=list(Music$Age))
plot(stmca)
textvarsup(stmca,Music$Age,col='red')



