library(ztable)


### Name: addCellColor
### Title: Add column colors of an object of ztable
### Aliases: addCellColor

### ** Examples

z=ztable(head(iris))
z=addRowColor(z,c(1,3),color="platinum")
z=addColColor(z,2,color="syan")
z=addCellColor(z,cols=c(5,4),rows=5,color="red")
z



