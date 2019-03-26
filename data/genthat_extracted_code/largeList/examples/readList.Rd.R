library(largeList)


### Name: readList
### Title: Get elements from a list file.
### Aliases: readList

### ** Examples

list_1 <- list("A" = c(1,2), "B" = "abc", list(1, 2, 3))
saveList(object = list_1, file = "example.llo")

# read the whole list
readList(file = "example.llo")

# by numeric indices
readList(file = "example.llo", index = c(1, 3))

# by names
readList(file = "example.llo", index = c("A", "B"))

# by logical indices
readList(file = "example.llo", index = c(TRUE, FALSE, TRUE))




