library(DiscriMiner)


### Name: geoDA
### Title: Geometric Predictive Discriminant Analysis
### Aliases: geoDA

### ** Examples

## Not run: 
##D   # load bordeaux wines dataset
##D   data(iris)
##D 
##D   # geometric predictive discriminant analysis with no validation
##D   my_geo1 = geoDA(iris[,1:4], iris$Species)
##D   my_geo1$confusion
##D   my_geo1$error_rate
##D 
##D   # geometric predictive discriminant analysis with cross-validation
##D   my_geo2 = geoDA(iris[,1:4], iris$Species, validation="crossval")
##D   my_geo2$confusion
##D   my_geo2$error_rate
##D   
## End(Not run)



