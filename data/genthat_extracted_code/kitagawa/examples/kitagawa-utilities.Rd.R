library(kitagawa)


### Name: kitagawa-utilities
### Title: General utility functions
### Aliases: kitagawa-utilities .nullchk .in0to1 is.wrsp is.owrsp

### ** Examples

## Not run: 
##D .nullchk(1:10) # OK
##D .nullchk(NULL) # error
##D .nullchk(c(1:10,NULL)) # error
##D .nullchk(NA) # error
##D .nullchk(c(1:10,NA)) # error
##D 
##D .in0to1(1:10) # error
##D .in0to1(NULL) # error
##D .in0to1(c(1:10,NULL)) # error
##D .in0to1(NA) # error
##D .in0to1(c(1:10,NA)) # error
##D .in0to1(c(1,NA)) # error
##D 
##D is.wrsp(1) # FALSE
## End(Not run)



