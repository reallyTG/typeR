library(largeList)


### Name: $.largeList
### Title: Overload of operator $.
### Aliases: $.largeList

### ** Examples

largelist_object <- getList("example.llo", truncate = TRUE)
largelist_object[[]] <- list("AA" = 1, "B" = 2, "C" = 3)  ## assign list to the list file
largelist_object$B ## get 2
largelist_object$A ## get NULL, not 1 from "AA" since no partial matching happens.



