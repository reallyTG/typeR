library(difR)


### Name: LRT
### Title: Likelihood-Ratio Test DIF statistic
### Aliases: LRT

### ** Examples

## Not run: 
##D 
##D  # Loading of the verbal data
##D  data(verbal)
##D  attach(verbal)
##D 
##D  # Excluding the "Anger" variable
##D  verbal <- verbal[colnames(verbal)!="Anger"]
##D 
##D  # Keeping the first 5 items and the first 50 subjects
##D  # (this is an artificial simplification to reduce the computational time)
##D  # Sixth column holds the group membership
##D  verbal <- verbal[1:50, c(1:5, 25)]
##D 
##D  # Likelihood-ratio statistics
##D  LRT(verbal[,1:5], verbal[,6])
##D  
## End(Not run)
 


