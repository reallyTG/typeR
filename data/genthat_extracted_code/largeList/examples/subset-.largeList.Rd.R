library(largeList)


### Name: [<-.largeList
### Title: Overload of operator []<-.
### Aliases: [<-.largeList

### ** Examples

largelist_object <- getList("example.llo", truncate = TRUE)
largelist_object[] <- list("A" = 1, "B" = 2)  ## append list to the list file
largelist_object[] <- list("C" = 3, "D" = 4)  ## append list to the list file
largelist_object[1] <- NULL ## remove first element
largelist_object["B"] <- NULL ## remove element with name "B"
largelist_object[c("C","D")] <- c(5, 6) ## change value
largelist_object[2] <- 5 ## change value
largelist_object[c(4, 5)] <- list(6, 7) ## append 6, 7 to 4th, 5th position and NULL to 3rd position



