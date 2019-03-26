library(GDAtools)


### Name: wtable
### Title: Computes a (possibly weighted) contingency table
### Aliases: wtable
### Keywords: multivariate misc

### ** Examples

## Computes a contingency table
## of jazz and age variables
## from the 'Music' example data set
## with or without weights
data(Music)
wtable(Music$Jazz)
wtable(Music$Jazz,Music$Age)

weight <- sample(0:20,nrow(Music),TRUE)/10
wtable(Music$Jazz,w=weight,digits=1)
wtable(Music$Jazz,Music$Age,weight,1)



