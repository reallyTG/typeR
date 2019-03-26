library(mau)


### Name: Make.Decision.Tree
### Title: Evaluate utilities
### Aliases: Make.Decision.Tree

### ** Examples

library( data.table )
library( igraph )
file<-system.file("extdata", "tree.csv", package = "mau" )
tree.data<-Read.Tree( file, skip = 0, nrows = 8 )
tree<-Make.Decision.Tree( tree.data )
plot( tree )



