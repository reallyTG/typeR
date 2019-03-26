library(FRESA.CAD)


### Name: nearestNeighborImpute
### Title: nearest neighbor NA imputation
### Aliases: nearestNeighborImpute
### Keywords: Data_Conditioning

### ** Examples

	## Not run: 
##D 	# Get the stage C prostate cancer data from the rpart package
##D 	library(rpart)
##D 	data(stagec)
##D 	# Set the options to keep the na
##D 	options(na.action='na.pass')
##D 	# create a model matrix with all the NA values imputed
##D 	stagecImputed <- nearestNeighborImpute(model.matrix(~.,stagec)[,-1])
##D 	
## End(Not run)



