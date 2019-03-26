library(SSBtools)


### Name: FindCommonCells
### Title: Finding commonCells
### Aliases: FindCommonCells

### ** Examples

 x <- rep(c('A','B','C'),3)
 y <- rep(c(11,22,11),3)
 z <- c(1,1,1,2,2,2,3,3,3)
 zy <- paste(z,y,sep='')
 m <- cbind(x,y,z,zy)
 fg <- FindTableGroup(m,findLinked=TRUE)
 dimLists <- FindDimLists(m,fg$groupVarInd)
 # Using table1 and table2 in this example cause error,
 # but in other cases this may work well
 try(FindCommonCells(dimLists[fg$table$table1],dimLists[fg$table$table2]))
 FindCommonCells(dimLists[c(1,2)],dimLists[c(1,3)])



