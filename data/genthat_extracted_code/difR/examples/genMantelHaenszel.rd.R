library(difR)


### Name: genMantelHaenszel
### Title: Generalized Mantel-Haenszel DIF statistic
### Aliases: genMantelHaenszel

### ** Examples

## Not run: 
##D 
##D  # Loading of the verbal data
##D  data(verbal)
##D  attach(verbal)
##D 
##D  # Creating four groups according to gender (0 or 1) and trait anger
##D  # score ("Low" or "High")
##D  # Reference group: women with low trait anger score (<=20)
##D  group <- rep(0, nrow(verbal))
##D  group[Anger>20 & Gender==0] <- 1
##D  group[Anger<=20 & Gender==1] <- 2
##D  group[Anger>20 & Gender==1] <- 3
##D 
##D  # Without continuity correction
##D  genMantelHaenszel(verbal[,1:24], group)
##D 
##D  # Removing item 6 from the set of anchor items
##D  genMantelHaenszel(verbal[,1:24], group, anchor = c(1:5, 7:24))
##D  
## End(Not run)
 


