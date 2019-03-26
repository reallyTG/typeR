library(DiscriMiner)


### Name: plsDA_old
### Title: PLS Discriminant Analysis
### Aliases: plsDA_old
### Keywords: internal

### ** Examples

## Not run: 
##D   # load iris dataset
##D   data(iris)
##D 
##D   # PLS discriminant analysis specifying number of components = 2
##D   my_pls1 = plsDA(iris[,1:4], iris$Species, autosel=FALSE, comps=2)
##D   my_pls1$confusion
##D   my_pls1$error_rate
##D   # plot circle of correlations
##D   plot(my_pls1)
##D 
##D   # PLS discriminant analysis with automatic selection of components
##D   my_pls2 = plsDA(iris[,1:4], iris$Species, autosel=TRUE)
##D   my_pls2$confusion
##D   my_pls2$error_rate
##D 
##D   # linear discriminant analysis with learn-test validation
##D   learning = c(1:40, 51:90, 101:140)
##D   testing = c(41:50, 91:100, 141:150)
##D   my_pls3 = plsDA(iris[,1:4], iris$Species, validation="learntest", learn=learning, test=testing)
##D   my_pls3$confusion
##D   my_pls3$error_rate
##D   
## End(Not run)



