library(largeList)


### Name: isListCompressed
### Title: Check if elements are compressed in the file.
### Aliases: isListCompressed

### ** Examples

list_1 <- list("A" = c(1,2), "B" = "abc", list(1, 2, 3))
saveList(object = list_1, file = "example.llo", compress = FALSE)
isListCompressed(file = "example.llo") # get FALSE




