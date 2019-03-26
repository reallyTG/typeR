library(NCmisc)


### Name: Unlist
### Title: Unlist a list, starting only from a set depth.
### Aliases: Unlist

### ** Examples

complex.list <- list(1,1:3,list(2,2:4,list(3,3:4,list(10))),list(4,5:7,list(3)))
Unlist(complex.list,0) # equivalent to unlist()
Unlist(complex.list,1) # unlist within the top level lists
Unlist(complex.list,2) # unlist within the second level lists
Unlist(complex.list,10) # once depth >= list-depth, no difference
unlist(complex.list,recursive=FALSE) # not the same as any of the above



