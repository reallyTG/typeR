library(largeList)


### Name: print.largeList
### Title: Overload of function print.
### Aliases: print.largeList

### ** Examples

largelist_object <- getList("example.llo", truncate = TRUE)
largelist_object[[]] <- list("A" = 1, "B" = 2, "C" = 3)  ## assign list to the list file
print(largelist_object) ## print to screen
largelist_object ## print to screen



