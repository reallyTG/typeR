library(largeList)


### Name: getListName
### Title: Get names of elements in a list file.
### Aliases: getListName

### ** Examples

list_1 <- list("A" = c(1,2), "B" = "abc", list(1, 2, 3))
saveList(object = list_1, file = "example.llo")
getListName(file = "example.llo")




