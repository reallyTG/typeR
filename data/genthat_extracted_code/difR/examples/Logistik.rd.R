library(difR)


### Name: Logistik
### Title: Logistic regression DIF statistic
### Aliases: Logistik

### ** Examples

## Not run: 
##D 
##D  # Loading of the verbal data
##D  data(verbal)
##D 
##D  # Testing both types of DIF simultaneously
##D  # With all items, test score as matching criterion
##D  Logistik(verbal[,1:24], verbal[,26])
##D 
##D  # Returning all covariance matrices of model parameters
##D  Logistik(verbal[,1:24], verbal[,26], all.cov = TRUE)
##D 
##D  # Testing both types of DIF simultaneously
##D  # With all items and Wald test
##D  Logistik(verbal[,1:24], verbal[,26], criterion = "Wald")
##D 
##D  # Removing item 6 from the set of anchor items
##D  Logistik(verbal[,1:24], verbal[,26], anchor = c(1:5, 7:24))
##D 
##D  # Testing for nonuniform DIF
##D  Logistik(verbal[,1:24], verbal[,26], type = "nudif")
##D 
##D  # Testing for uniform DIF
##D  Logistik(verbal[,1:24], verbal[,26], type = "udif")
##D 
##D  # Using the "anger" trait variable as matching criterion
##D  Logistik(verbal[,1:24],verbal[,26], match = verbal[,25])
##D 
##D  # Using the "anger" trait variable as group membership
##D  Logistik(verbal[,1:24],verbal[,25], member.type = "cont")
##D  
## End(Not run)
 


