library(largeList)


### Name: saveList
### Title: Save or append elements to a list file.
### Aliases: saveList

### ** Examples

list_1 <- list("A" = c(1,2), "B" = "abc", list(1, 2, 3))

# save list_1 to file using compression.
saveList(object = list_1, file = "example.llo", append = FALSE, compress = TRUE)

# append list_1 to file, compress option will be extracted from the file.
saveList(object = list_1, file = "example.llo", append = TRUE)




