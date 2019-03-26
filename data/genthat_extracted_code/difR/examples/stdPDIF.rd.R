library(difR)


### Name: stdPDIF
### Title: Standardization DIF statistic
### Aliases: stdPDIF

### ** Examples

 ## Not run: 
##D  # Loading of the verbal data
##D  data(verbal)
##D 
##D  # All items as anchor items
##D  stdPDIF(verbal[,1:24], verbal[,26])
##D 
##D  # All items as anchor items, reference group weights
##D  stdPDIF(verbal[,1:24], verbal[,26], stdWeight = "reference")
##D 
##D  # All items as anchor items, both groups' weights
##D  stdPDIF(verbal[,1:24], verbal[,26], stdWeight = "total")
##D 
##D  # Removing item 6 from the set of anchor items
##D  stdPDIF(verbal[,1:24], verbal[,26], anchor = c(1:5,7:24))
##D  
## End(Not run)
 


