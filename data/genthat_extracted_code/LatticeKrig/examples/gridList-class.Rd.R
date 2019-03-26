library(LatticeKrig)


### Name: gridList-class
### Title: Class '"gridList"'. A description of a regular and
###   multidimensional grid.
### Aliases: gridList-class gridListInfo gridList
### Keywords: classes

### ** Examples

showClass("gridList")
# a 3-d grid
grid<- structure(
 list( x= seq( -1,1,,20), y= seq( 0,1,,15) ,oneMore = 1:10) ,
 class= "gridList" )



