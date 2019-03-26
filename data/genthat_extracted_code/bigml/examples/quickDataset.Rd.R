library(bigml)


### Name: quickDataset
### Title: Quickly Creating BigML Datasets
### Aliases: quickDataset

### ** Examples

## Not run: 
##D # simple example
##D iris.d = quickDataset(iris)
##D # configure a number of different parameters
##D iris.d2 = quickDataset(iris, fields = c('Species', 'Sepal.length'),
##D 	name='test', size=10000)
## End(Not run)



