library(largeList)


### Name: names.largeList
### Title: Overload of function names.
### Aliases: names.largeList

### ** Examples

largelist_object <- getList("example.llo", truncate = TRUE)
largelist_object[[]] <- list("A" = 1, "B" = 2, "C" = 3)  ## assign list to the list file
names(largelist_object) ## get c("A", "B", "C")



