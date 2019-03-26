library(SHIP)


### Name: check.path
### Title: Check if two genes belong to any common KEGG pathway.
### Aliases: check.path
### Keywords: internal

### ** Examples

g1 <- c("path1","path2","path3","path4")
g2 <- c("path5","path6","path3","path11")
g3 <- c("path10","path5","path12","path13")
check.path(g1,g2) # 1
check.path(g1,g3) # 0



