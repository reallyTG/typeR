library(DiscriMiner)


### Name: classify
### Title: Classification function
### Aliases: classify

### ** Examples

## Not run: 
##D   # load iris dataset
##D   data(iris)
##D 
##D   # linear discriminant analysis
##D   my_lin1 = linDA(iris[,1:4], iris$Species)
##D 
##D   # select a sample of 15 observations
##D   set.seed(111)
##D   obs = sample(1:nrow(iris), 15)
##D   some_data = iris[obs, 1:4]
##D 
##D   # classify some_data
##D   get_classes = classify(my_lin1, some_data)
##D   get_classes
##D 
##D   # compare the results against original class
##D   table(iris$Species[obs], get_classes$pred_class)
##D   
## End(Not run)



