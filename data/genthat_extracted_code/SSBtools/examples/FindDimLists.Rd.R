library(SSBtools)


### Name: FindDimLists
### Title: Finding dimList
### Aliases: FindDimLists

### ** Examples

 x <- rep(c('A','B','C'),3)
 y <- rep(c(11,22,11),3)
 z <- c(1,1,1,2,2,2,3,3,3)
 zy <- paste(z,y,sep='')
 m <- cbind(x,y,z,zy)
 FindDimLists(m)



