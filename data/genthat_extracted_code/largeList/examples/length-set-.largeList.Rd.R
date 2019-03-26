library(largeList)


### Name: length<-.largeList
### Title: Overload of function length<-.
### Aliases: length<-.largeList

### ** Examples

largelist_object <- getList("example.llo", truncate = TRUE)
largelist_object[[]] <- list("A" = 1, "B" = 2, "C" = 3)  ## assign list to the list file
length(largelist_object) <- 5 ## get list("A" = 1, "B" = 2, "C" = 3, NULL, NULL)



