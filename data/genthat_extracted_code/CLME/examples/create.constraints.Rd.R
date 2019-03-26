library(CLME)


### Name: create.constraints
### Title: Generate common order constraints
### Aliases: create.constraints

### ** Examples

## Not run: 
##D   # For simple order, the node does not matter
##D   create.constraints( P1 = 5, constraints = list( order='simple' , 
##D                                                   decreasing=FALSE ))
##D   
##D   # Compare constraints against decreasing=TRUE
##D   create.constraints( P1 = 5, constraints=list( order='simple' , 
##D                                                 decreasing=TRUE ))
##D   
##D   # Umbrella order
##D   create.constraints( P1 = 5, constraints=list( order='umbrella' , node=3
##D                                                 , decreasing=FALSE ))
## End(Not run)





