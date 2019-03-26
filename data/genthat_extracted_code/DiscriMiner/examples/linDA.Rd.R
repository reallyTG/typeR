library(DiscriMiner)


### Name: linDA
### Title: Linear Discriminant Analysis
### Aliases: linDA

### ** Examples

## Not run: 
##D   # load iris dataset
##D   data(iris)
##D 
##D   # linear discriminant analysis with no validation
##D   my_lin1 = linDA(iris[,1:4], iris$Species)
##D   my_lin1$confusion
##D   my_lin1$error_rate
##D 
##D   # linear discriminant analysis with cross-validation
##D   my_lin2 = linDA(iris[,1:4], iris$Species, validation="crossval")
##D   my_lin2$confusion
##D   my_lin2$error_rate
##D 
##D   # linear discriminant analysis with learn-test validation
##D   learning = c(1:40, 51:90, 101:140)
##D   testing = c(41:50, 91:100, 141:150)
##D   my_lin3 = linDA(iris[,1:4], iris$Species, validation="learntest", learn=learning, test=testing)
##D   my_lin3$confusion
##D   my_lin3$error_rate
##D   
## End(Not run)



