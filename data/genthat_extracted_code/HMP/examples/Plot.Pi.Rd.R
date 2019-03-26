library(HMP)


### Name: Plot.PI
### Title: Plot the Pi Vector
### Aliases: Plot.PI

### ** Examples

	## Not run: 
##D 		data(saliva)
##D 		data(throat)
##D 		data(tonsils)
##D 		
##D 		### Combine the data sets into a single list
##D 		group.data <- list(saliva, throat, tonsils)
##D 		
##D 		### Get PI using MLE with CI
##D 		mle <- Est.PI(group.data)$MLE
##D 		
##D 		### Plot with Error Bars
##D 		Plot.PI(mle)
##D 		
##D 		### Plot without Error Bars
##D 		Plot.PI(mle, FALSE)
##D 		
##D 		### Plot with Error Bars and scaling
##D 		Plot.PI(mle, TRUE, TRUE)
##D 	
## End(Not run)



