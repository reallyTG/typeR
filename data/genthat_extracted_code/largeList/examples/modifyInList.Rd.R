library(largeList)


### Name: modifyInList
### Title: Modify elements in a list file.
### Aliases: modifyInList

### ** Examples

list_1 <- list("A" = c(1,2), "B" = "abc", list(1, 2, 3))
saveList(object = list_1, file = "example.llo")

# by numeric indices
modifyInList(file = "example.llo", index = c(1,2), object = list("AA","BB"))

# by names
modifyInList(file = "example.llo", index = c("AA","BB"), object = list("A","B"))

# by logical indices
modifyInList(file = "example.llo", index = c(TRUE, FALSE, TRUE), object = list("A","B"))




