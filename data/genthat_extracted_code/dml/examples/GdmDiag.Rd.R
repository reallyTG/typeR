library(dml)


### Name: GdmDiag
### Title: Global Distance Metric Learning
### Aliases: GdmDiag
### Keywords: GDM distance global learning mahalanobis metirc metric
###   transformation

### ** Examples

## Not run: 
##D set.seed(602)
##D library(MASS)
##D library(scatterplot3d)
##D 
##D # generate simulated Gaussian data
##D k = 100
##D m <- matrix(c(1, 0.5, 1, 0.5, 2, -1, 1, -1, 3), nrow =3, byrow = T)
##D x1 <- mvrnorm(k, mu = c(1, 1, 1), Sigma = m)
##D x2 <- mvrnorm(k, mu = c(-1, 0, 0), Sigma = m)
##D data <- rbind(x1, x2)
##D 
##D # define similar constrains
##D simi <- rbind(t(combn(1:k, 2)), t(combn((k+1):(2*k), 2)))
##D 
##D temp <-  as.data.frame(t(simi))
##D tol <- as.data.frame(combn(1:(2*k), 2))
##D 
##D # define disimilar constrains
##D dism <- t(as.matrix(tol[!tol %in% simi]))
##D 
##D # transform data using GdmDiag
##D result <- GdmDiag(data, simi, dism)
##D newData <- result$newData
##D # plot original data
##D color <- gl(2, k, labels = c("red", "blue"))
##D par(mfrow = c(2, 1), mar = rep(0, 4) + 0.1)
##D scatterplot3d(data, color = color, cex.symbols = 0.6,
##D 			  xlim = range(data[, 1], newData[, 1]),
##D 			  ylim = range(data[, 2], newData[, 2]),
##D 			  zlim = range(data[, 3], newData[, 3]),
##D 			  main = "Original Data")
##D # plot GdmDiag transformed data
##D scatterplot3d(newData, color = color, cex.symbols = 0.6,
##D 			  xlim = range(data[, 1], newData[, 1]),
##D 			  ylim = range(data[, 2], newData[, 2]),
##D 			  zlim = range(data[, 3], newData[, 3]),
##D 			  main = "Transformed Data")
## End(Not run)



