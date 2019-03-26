library(nbc4va)


### Name: ova2nbc
### Title: Translate open verbal autopsy arguments to train a NBC model
### Aliases: ova2nbc

### ** Examples

## Not run: 
##D library(openVA)  # install.packages("openVA")
##D library(nbc4va)
##D 
##D # Obtain some openVA formatted data
##D data(RandomVA3) # cols: deathId, cause, symptoms..
##D train <- RandomVA3[1:100, ]
##D test <- RandomVA3[101:200, ]
##D 
##D # Run naive bayes classifier on openVA data
##D results <- ova2nbc(train, test, "cause")
##D 
##D # Obtain the probabilities and predictions
##D prob <- results$prob.causes
##D pred <- results$pred.causes
## End(Not run)




