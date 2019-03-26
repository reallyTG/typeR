library(TSTr)


### Name: newTree
### Title: Creates a new ternary search tree
### Aliases: newTree

### ** Examples

fruitTree <- newTree(c("apple", "orange"))
fileConn <- file("XMIwords.txt")
writeLines(head(XMIwords,100), fileConn)
close(fileConn)
enTree <- newTree("XMIwords.txt")



