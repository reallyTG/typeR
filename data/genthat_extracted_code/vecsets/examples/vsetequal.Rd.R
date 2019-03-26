library(vecsets)


### Name: vsetequal
### Title: Check whether two vectors contain exactly the same collection of
###   elements.
### Aliases: vsetequal

### ** Examples

x <- c(1:5,3,3,3,2,NA,NA)
y<- c(1:5,4,3,NA)
vsetequal(x,y)
vsetequal(x,y,multiple=FALSE) 
setequal(x,y) #same as previous line



