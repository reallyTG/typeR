library(largeList)


### Name: [[.largeList
### Title: Overload of operator [[]].
### Aliases: [[.largeList

### ** Examples

largelist_object <- getList("example.llo", truncate = TRUE)
largelist_object[[]] <- list("A" = 1, "B" = 2, "C" = 3)  ## assign list to the list file
largelist_object[[1]] ## get 1
largelist_object[["B"]] ## get 2



