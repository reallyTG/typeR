library(vecsets)


### Name: vsetdiff
### Title: Find all elements in first argument which are not in second
###   argument.
### Aliases: vsetdiff

### ** Examples

x <- c(1:5,3,3,3,2,NA,NA)
y<- c(2:5,4,3,NA)
vsetdiff(x,y)
vsetdiff(x,y,multiple=FALSE)
setdiff(x,y) # same as previous line
vsetdiff(y,x) #note the asymmetry



