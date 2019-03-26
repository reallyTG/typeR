library(factoextra)


### Name: print.factoextra
### Title: Print method for an object of class factoextra
### Aliases: print.factoextra

### ** Examples

 data(iris)
 res.pca <- prcomp(iris[, -5],  scale = TRUE)
 ind <- get_pca_ind(res.pca, data = iris[, -5])
 print(ind)
 



