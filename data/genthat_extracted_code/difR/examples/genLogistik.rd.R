library(difR)


### Name: genLogistik
### Title: Generalized logistic regression DIF statistic
### Aliases: genLogistik

### ** Examples

## Not run: 
##D 
##D  # Loading of the verbal data
##D  data(verbal)
##D  attach(verbal)
##D 
##D  # Creating four groups according to gender (0 or 1) and trait anger score
##D  # ("Low" or "High")
##D  # Reference group: women with low trait anger score (<=20)
##D  group <- rep(0,nrow(verbal))
##D  group[Anger>20 & Gender==0] <- 1
##D  group[Anger<=20 & Gender==1] <- 2
##D  group[Anger>20 & Gender==1] <- 3
##D 
##D  # Testing both types of DIF simultaneously
##D  # With all items
##D  genLogistik(verbal[,1:24], group)
##D  genLogistik(verbal[,1:24], group, criterion = "Wald")
##D 
##D  # Removing item 6 from the set of anchor items
##D  genLogistik(verbal[,1:24], group, anchor = c(1:5, 7:24))
##D  genLogistik(verbal[,1:24], group, anchor = c(1:5, 7:24), criterion = "Wald")
##D 
##D  # Testing nonuniform DIF effect
##D  genLogistik(verbal[,1:24], group, type = "nudif")
##D  genLogistik(verbal[,1:24], group, type = "nudif", criterion="Wald")
##D 
##D  # Testing uniform DIF effect
##D  genLogistik(verbal[,1:24], group, type = "udif")
##D  genLogistik(verbal[,1:24], group, type = "udif", criterion="Wald")
##D 
##D  # Using trait anger score as matching criterion
##D  genLogistik(verbal[,1:24], group, match = verbal[,25])
##D  
## End(Not run)
 


