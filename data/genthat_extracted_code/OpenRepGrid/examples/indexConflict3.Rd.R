library(OpenRepGrid)


### Name: indexConflict3
### Title: Conflict or inconsistenciy measure for grids (Bell, 2004) based
###   on distances.
### Aliases: indexConflict3

### ** Examples

## Not run: 
##D 
##D  # calculate conflicts
##D  indexConflict3(bell2010)
##D  
##D  # show additional stats for elements 1 to 3
##D  indexConflict3(bell2010, e.out=1:3)
##D  
##D  # show additional stats for constructs 1 and 5
##D  indexConflict3(bell2010, c.out=c(1,5))
##D  
##D  # finetune output
##D  ## change number of digits
##D  x <- indexConflict3(bell2010)
##D  print(x, digits=4)
##D 
##D  ## omit discrepancy matrices for constructs
##D  x <- indexConflict3(bell2010, c.out=5:6)
##D  print(x, discrepancies=FALSE)
##D  
## End(Not run)





