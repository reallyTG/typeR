library(difR)


### Name: breslowDay
### Title: Breslow-Day DIF statistic
### Aliases: breslowDay

### ** Examples

## Not run: 
##D 
##D  # Loading of the verbal data
##D  data(verbal)
##D 
##D  # With all items as anchor items
##D  breslowDay(verbal[,1:24], verbal[,26])
##D 
##D  # With all items as anchor items and trend
##D  # test statistic
##D  breslowDay(verbal[,1:24], verbal[,26], BDstat = "trend")
##D 
##D  # Removing item 3 from the set of anchor items
##D  breslowDay(verbal[,1:24], verbal[,26], anchor = c(1:5, 7:24))
## End(Not run)



