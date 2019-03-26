library(vecsets)


### Name: vintersect
### Title: Perform intersection of two vectors, including counting repeated
###   elements.
### Aliases: vintersect

### ** Examples

x <- c(1:5,3,3,3,2,NA,NA)
y<- c(2:5,4,3,NA)
vintersect(x,y)
vintersect(x,y,multiple=FALSE) 
intersect(x,y) #same as previous line



