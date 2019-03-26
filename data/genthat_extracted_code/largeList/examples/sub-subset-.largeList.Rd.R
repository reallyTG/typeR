library(largeList)


### Name: [[<-.largeList
### Title: Overload of operator [[]]<-.
### Aliases: [[<-.largeList

### ** Examples

largelist_object <- getList("example.llo", truncate = TRUE)
largelist_object[[]] <- list("A" = 1, "B" = 2, "C" = 3)  ## assign list to the list file
largelist_object[[1]] <- NULL ## remove first element
largelist_object[["B"]] <- NULL ## remove element with name "B"
largelist_object[["C"]] <- 5 ## change value
largelist_object[[2]] <- 5 ## change value
largelist_object[[4]] <- 6 ## append 6 to 4th and NULL to 3rd position



