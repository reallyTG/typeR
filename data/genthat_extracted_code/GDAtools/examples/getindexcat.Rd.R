library(GDAtools)


### Name: getindexcat
### Title: Returns the names of the categories in a data frame
### Aliases: getindexcat
### Keywords: multivariate misc

### ** Examples

data(Music)
getindexcat(Music[,1:5])
mca <- speMCA(Music[,1:5],excl=c(3,6,9,12,15))



