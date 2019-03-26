library(largeList)


### Name: [.largeList
### Title: Overload of operator [].
### Aliases: [.largeList

### ** Examples

largelist_object <- getList("example.llo", truncate = TRUE)
largelist_object[[]] <- list("A" = 1, "B" = 2, "C" = 3)  ## assign list to the list file
largelist_object[c(1, 2)] ## get list("A" = 1, "B" = 2)
largelist_object[c(TRUE, FALSE, TRUE)] ## get list("A" = 1, "C" = 3)
largelist_object[c("A", "C")] ## get list("A" = 1, "C" = 3)



