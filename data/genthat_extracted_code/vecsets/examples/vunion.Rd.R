library(vecsets)


### Name: vunion
### Title: Returns the union of its inputs including repeated elements.
### Aliases: vunion

### ** Examples

x <- c(1:5,3,3,3,2,NA,NA)
y<- c(2:5,4,3,NA)
vunion(x,y)
vunion(x,y,multiple=FALSE) 
union(x,y) #same as previous line



