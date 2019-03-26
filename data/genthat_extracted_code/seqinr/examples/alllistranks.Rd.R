library(seqinr)


### Name: alllistranks
### Title: To get the count of existing lists and all their ranks on server
### Aliases: alllistranks alr
### Keywords: utilities

### ** Examples

 ## Not run: 
##D # Need internet connection
##D  choosebank("emblTP")
##D  tmp1 <- query("tmp1", "sp=Borrelia burgdorferi", virtual = TRUE)
##D  tmp2 <- query("tmp2", "sp=Borrelia burgdorferi", virtual = TRUE)
##D  tmp3 <- query("tmp3", "sp=Borrelia burgdorferi", virtual = TRUE)
##D  (result <- alllistranks())
##D  stopifnot(result$count == 3)   # Three ACNUC lists
##D  stopifnot(result$ranks == 2:4) # Starting at rank 2
##D  #
##D  # Summay of current lists defined on the ACNUC server:
##D  #
##D  sapply(result$ranks, getliststate)
##D  closebank()
##D  
## End(Not run)



