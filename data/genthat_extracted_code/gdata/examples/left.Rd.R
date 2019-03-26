library(gdata)


### Name: left
### Title: Return the leftmost or rightmost columns of a matrix or
###   dataframe
### Aliases: right left
### Keywords: manip

### ** Examples

 m <- matrix( 1:100, ncol=10 )
 colnames(m) <- paste("Col",1:10, sep="_")
 left(m)
 right(m)

 d <- as.data.frame(m)
 left(d)
 right(d)



