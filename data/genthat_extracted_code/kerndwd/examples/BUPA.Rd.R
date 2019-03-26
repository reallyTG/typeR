library(kerndwd)


### Name: BUPA
### Title: BUPA's liver disorders data
### Aliases: BUPA
### Keywords: data set

### ** Examples

# load data set
data(BUPA)

# the number of samples predictors
dim(BUPA$X)

# the number of samples for each class
sum(BUPA$y == -1) 
sum(BUPA$y == 1)



