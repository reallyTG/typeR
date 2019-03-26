library(difR)


### Name: mantelHaenszel
### Title: Mantel-Haenszel DIF statistic
### Aliases: mantelHaenszel

### ** Examples

## Not run: 
##D 
##D  # Loading of the verbal data
##D  data(verbal)
##D 
##D  # With and without continuity correction
##D  mantelHaenszel(verbal[,1:24], verbal[,26])
##D  mantelHaenszel(verbal[,1:24], verbal[,26], correct = FALSE)
##D  
##D  # Exact test
##D  mantelHaenszel(verbal[,1:24], verbal[,26], exact = TRUE)
##D 
##D  # Removing item 6 from the set of anchor items
##D  mantelHaenszel(verbal[,1:24], verbal[,26], anchor = c(1:5,7:24))
##D  
## End(Not run)
 


