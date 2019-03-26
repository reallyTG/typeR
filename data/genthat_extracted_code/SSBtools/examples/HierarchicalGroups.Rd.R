library(SSBtools)


### Name: HierarchicalGroups
### Title: Finding hierarchical variable groups
### Aliases: HierarchicalGroups

### ** Examples

 x <- rep(c("A","B","C"),3)
 y <- rep(c(11,22,11),3)
 z <- c(1,1,1,2,2,2,3,3,3)
 zy <- paste(z,y,sep="")
 m <- cbind(x,y,z,zy)
 HierarchicalGroups(m)



