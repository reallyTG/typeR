library(sdwd)


### Name: colon
### Title: simplified gene expression data from Alon et al. (1999)
### Aliases: colon
### Keywords: datasets

### ** Examples

# load sdwd library
library(sdwd)

# load data set
data(colon)

# how many samples and how many predictors?
dim(colon$x)

# how many samples of class -1 and 1 respectively?
sum(colon$y == -1)
sum(colon$y == 1)



