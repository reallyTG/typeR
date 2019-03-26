library(scrime)


### Name: gknn
### Title: Generalized k Nearest Neighbors
### Aliases: gknn
### Keywords: classif

### ** Examples
## Not run: 
##D # Using the example from the function knn.
##D 
##D library(class)
##D data(iris3)
##D train <- rbind(iris3[1:25,,1], iris3[1:25,,2], iris3[1:25,,3])
##D test <- rbind(iris3[26:50,,1], iris3[26:50,,2], iris3[26:50,,3])
##D cl <- c(rep(2, 25), rep(1, 25), rep(1, 25))
##D 
##D knn.out <- knn(train, test, as.factor(cl), k = 3, use.all = FALSE)
##D gknn.out <- gknn(train, cl, test, nn = 3)
##D 
##D # Both applications lead to the same predictions.
##D 
##D knn.out == gknn.out
##D 
##D # But gknn allows to use other distance measures than the Euclidean 
##D # distance. E.g., the Manhattan distance.
##D 
##D gknn(train, cl, test, nn = 3, distance = "manhattan")
##D 
## End(Not run)


