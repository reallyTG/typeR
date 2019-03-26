library(HMP)


### Name: Est.PI
### Title: Estimate the Pi Vector
### Aliases: Est.PI

### ** Examples

	## Not run: 
##D 		data(saliva)
##D 		data(throat)
##D 		data(tonsils)
##D 		
##D 		### Combine the data sets into a single list
##D 		group.data <- list(saliva, throat, tonsils)
##D 		
##D 		### Get PI using MLE and MOM with CI
##D 		piEsts <- Est.PI(group.data)
##D 		
##D 		mle <- piEsts$MLE
##D 		mom <- piEsts$MOM
##D 	
## End(Not run)



