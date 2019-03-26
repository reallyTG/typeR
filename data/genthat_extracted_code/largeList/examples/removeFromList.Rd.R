library(largeList)


### Name: removeFromList
### Title: Remove elements from a list file.
### Aliases: removeFromList

### ** Examples

list_1 <- list("A" = c(1,2), "B" = "abc", list(1, 2, 3))
saveList(object = list_1, file = "example.llo")

# by numeric indices
removeFromList(file = "example.llo", index = c(2))

# by name
removeFromList(file = "example.llo", index = c("A"))

# by logical indices
removeFromList(file = "example.llo", index = c(TRUE))




