library(bigml)


### Name: bigml-package
### Title: R bindings for BigML API
### Aliases: bigml bigml-package
### Keywords: package

### ** Examples

## Not run: 
##D 	# set default credentials
##D 	setCredentials('username', 'key')
##D 	model = quickModel(iris, 'Species')
##D 	quickPrediction(model, c(Petal.Width=0.2, Petal.Length=1.4))
##D 
##D 	# use specific credentials
##D 	quickPrediction(model, c(Petal.Width=0.2, Petal.Length=1.4),
##D     username='someuser', api_key='somekey')
##D 
##D 	# list most recent sources
##D  listSources()
##D 
##D 	# specify limit and offset
##D  listModels(limit=15,offset=300)
##D 
##D 	# specify filter criteria
##D  listDatasets(size__gt=1048576)
## End(Not run)



