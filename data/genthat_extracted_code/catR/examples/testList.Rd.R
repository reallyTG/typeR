library(catR)


### Name: testList
### Title: Testing the format of the input lists
### Aliases: testList

### ** Examples



 # Creation and test of a 'start' list
 start <- list(nrItems = 3, theta = c(-1, 0, 2, -2), randomesque = 2)
 testList(start, type = "start")

 # Using former 'halfRange' argument yields an error now:
 start <- list(nrItems = 3, theta = 0, halfRange = 2)
 testList(start, type = "start")

 # Modification of the list to introduce a mistake
 names(start)[1] <- "nrItem"
 testList(start, type = "start")
 
 # Creation and test of a 'test' list
 test <- list(method = "WL", itemSelect = "bOpt")
 testList(test, type = "test")

# Creation and test of a 'stop' list
 stop <- list(method = "WL")
 testList(stop, type = "test")

# Creation and test of a 'final' list (with mistake)
 final <- list(method = "MAP")
 testList(final, type = "final")
 


