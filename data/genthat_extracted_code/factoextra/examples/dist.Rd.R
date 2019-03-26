library(factoextra)


### Name: dist
### Title: Enhanced Distance Matrix Computation and Visualization
### Aliases: dist get_dist fviz_dist

### ** Examples

data(USArrests)
res.dist <- get_dist(USArrests, stand = TRUE, method = "pearson")

fviz_dist(res.dist, 
   gradient = list(low = "#00AFBB", mid = "white", high = "#FC4E07"))



