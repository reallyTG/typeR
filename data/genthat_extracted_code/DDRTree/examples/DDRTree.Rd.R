library(DDRTree)


### Name: DDRTree
### Title: Perform DDRTree construction
### Aliases: DDRTree DDRTree DDRTree-package DDRTree-package

### ** Examples

data('iris')
subset_iris_mat <- as.matrix(t(iris[c(1, 2, 52, 103), 1:4])) #subset the data
#run DDRTree with ncenters equal to species number
DDRTree_res <- DDRTree(subset_iris_mat, dimensions = 2, maxIter = 5, sigma = 1e-2,
lambda = 1, ncenter = 3, param.gamma = 10, tol = 1e-2, verbose = FALSE)
Z <- DDRTree_res$Z #obatain matrix
Y <- DDRTree_res$Y
stree <- DDRTree_res$stree
plot(Z[1, ], Z[2, ], col = iris[c(1, 2, 52, 103), 'Species']) #reduced dimension
legend("center", legend = unique(iris[c(1, 2, 52, 103), 'Species']), cex=0.8,
col=unique(iris[c(1, 2, 52, 103), 'Species']), pch = 1) #legend
title(main="DDRTree reduced dimension", col.main="red", font.main=4)
dev.off()
plot(Y[1, ], Y[2, ], col = 'blue', pch = 17) #center of the Z
title(main="DDRTree smooth principal curves", col.main="red", font.main=4)

#run DDRTree with ncenters equal to species number
DDRTree_res <- DDRTree(subset_iris_mat, dimensions = 2, maxIter = 5, sigma = 1e-3,
lambda = 1, ncenter = NULL,param.gamma = 10, tol = 1e-2, verbose = FALSE)
Z <- DDRTree_res$Z #obatain matrix
Y <- DDRTree_res$Y
stree <- DDRTree_res$stree
plot(Z[1, ], Z[2, ], col = iris[c(1, 2, 52, 103), 'Species']) #reduced dimension
legend("center", legend = unique(iris[c(1, 2, 52, 103), 'Species']), cex=0.8,
col=unique(iris[c(1, 2, 52, 103), 'Species']), pch = 1) #legend
title(main="DDRTree reduced dimension", col.main="red", font.main=4)
dev.off()
plot(Y[1, ], Y[2, ], col = 'blue', pch = 2) #center of the Z
title(main="DDRTree smooth principal graphs", col.main="red", font.main=4)



