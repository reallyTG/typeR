library(difR)


### Name: sibTest
### Title: SIBTEST DIF statistic
### Aliases: sibTest

### ** Examples

## Not run: 
##D 
##D  # Loading of the verbal data
##D  data(verbal)
##D 
##D  # Testing uniform DIF with all items
##D  sibTest(verbal[,1:24], verbal[,26])
##D 
##D  # Testing nonuniform DIF with all items
##D  sibTest(verbal[,1:24], verbal[,26], type = "nudif")
##D 
##D  # Removing item 6 from the set of anchor items
##D  sibTest(verbal[,1:24], verbal[,26], anchor = c(1:5, 7:24))
##D 
##D  # Considering items 3 to 9 as the set of anchor items
##D  sibTest(verbal[,1:24], verbal[,26], anchor = 3:9)
##D 
##D  
## End(Not run)
 


