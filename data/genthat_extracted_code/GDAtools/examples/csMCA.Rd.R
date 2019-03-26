library(GDAtools)


### Name: csMCA
### Title: Performs a 'class specific' MCA
### Aliases: csMCA
### Keywords: multivariate

### ** Examples

## Performs a 'class specific' MCA on 'Music' example data set
## ignoring every 'NA' (i.e. 'not available') categories,
## and focusing on the subset of women.
data(Music)
female <- Music$Gender=='Women'
mca <- csMCA(Music[,1:5],subcloud=female,excl=c(3,6,9,12,15))
plot(mca)



