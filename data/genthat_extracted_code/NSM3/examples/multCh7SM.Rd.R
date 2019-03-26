library(NSM3)


### Name: multCh7SM
### Title: Possible arrangements by row a matrix, where NA values are
###   ignored
### Aliases: multCh7SM
### Keywords: Row arrangements NA fixed

### ** Examples

##Get a matrix with some NA's
our.matrix<-matrix(c(NA,1,2,3,5,7,NA,NA,11),ncol=3,byrow=TRUE)
##Get every possible arrangement by row, treating the NA's as fixed
multCh7SM(our.matrix)



