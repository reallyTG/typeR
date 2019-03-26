library(mau)


### Name: Read.Tree
### Title: Evaluate utilities
### Aliases: Read.Tree

### ** Examples

library( data.table )
library( igraph )
file<-system.file("extdata", "tree.csv", package = "mau" )
sheetIndex<-1
tree.data<-Read.Tree( file, skip = 0, nrows = 8 )



