library(DiscriMiner)


### Name: quaDA
### Title: Quadratic Discriminant Analysis
### Aliases: quaDA

### ** Examples

## Not run: 
##D   # load iris dataset
##D   data(iris)
##D 
##D   # quadratic discriminant analysis with no validation
##D   my_qua1 = quaDA(iris[,1:4], iris$Species)
##D   my_qua1$confusion
##D   my_qua1$error_rate
##D 
##D   # quadratic discriminant analysis with cross-validation
##D   my_qua2 = quaDA(iris[,1:4], iris$Species, validation="crossval")
##D   my_qua2$confusion
##D   my_qua2$error_rate
##D 
##D   # quadratic discriminant analysis with learn-test validation
##D   learning = c(1:40, 51:90, 101:140)
##D   testing = c(41:50, 91:100, 141:150)
##D   my_qua3 = quaDA(iris[,1:4], iris$Species, validation="learntest",
##D       learn=learning, test=testing)
##D   my_qua3$confusion
##D   my_qua3$error_rate
##D   
## End(Not run)



