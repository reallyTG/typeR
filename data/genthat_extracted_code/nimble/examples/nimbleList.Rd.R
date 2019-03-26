library(nimble)


### Name: nimbleList
### Title: create a nimbleList
### Aliases: nimbleList

### ** Examples

 exampleNimListDef <- nimbleList(x = integer(0), Y = double(2))
 
 nimbleListTypes <- list(nimbleType(name = 'x', type = 'integer', dim = 0),
                         nimbleType(name = 'Y', type = 'double', dim = 2))
 
 ## this nimbleList definition is identical to the one created above
 exampleNimListDef <- nimbleList(nimbleListTypes)



