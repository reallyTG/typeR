library(largeList)


### Name: modifyNameInList
### Title: Modify names of elements in a list file.
### Aliases: modifyNameInList

### ** Examples

list_1 <- list("A" = c(1,2), "B" = "abc", list(1, 2, 3))
saveList(object = list_1, file = "example.llo")

# by numeric indices
modifyNameInList(file = "example.llo", index = c(1,2), name = c("AA","BB"))

# by logical indices
modifyNameInList(file = "example.llo", index = c(TRUE, TRUE, FALSE), name = c("AA","BB"))




