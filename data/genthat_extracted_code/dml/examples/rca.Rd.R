library(dml)


### Name: rca
### Title: Relevant Component Analysis
### Aliases: rca
### Keywords: mahalanobis metric rca transformation

### ** Examples

## Not run: 
##D set.seed(1234)
##D require(MASS)  # generate synthetic Gaussian data
##D k = 100        # sample size of each class
##D n = 3          # specify how many class
##D N = k * n      # total sample number
##D x1 = mvrnorm(k, mu = c(-10, 6), matrix(c(10, 4, 4, 10), ncol = 2))
##D x2 = mvrnorm(k, mu = c(0, 0), matrix(c(10, 4, 4, 10), ncol = 2))
##D x3 = mvrnorm(k, mu = c(10, -6), matrix(c(10, 4, 4, 10), ncol = 2))
##D x = as.data.frame(rbind(x1, x2, x3))
##D x$V3 = gl(n, k)
##D 
##D # The fully labeled data set with 3 classes
##D plot(x$V1, x$V2, bg = c("#E41A1C", "#377EB8", "#4DAF4A")[x$V3],
##D      pch = c(rep(22, k), rep(21, k), rep(25, k)))
##D Sys.sleep(3)
##D 
##D # Same data unlabeled; clearly the classes' structure is less evident
##D plot(x$V1, x$V2)
##D Sys.sleep(3)
##D 
##D chunk1 = sample(1:100, 5)
##D chunk2 = sample(setdiff(1:100, chunk1), 5)
##D chunk3 = sample(101:200, 5)
##D chunk4 = sample(setdiff(101:200, chunk3), 5)
##D chunk5 = sample(201:300, 5)
##D chks = x[c(chunk1, chunk2, chunk3, chunk4, chunk5), ]
##D chunks = list(chunk1, chunk2, chunk3, chunk4, chunk5)
##D 
##D # The chunklets provided to the RCA algorithm
##D plot(chks$V1, chks$V2, col = rep(c("#E41A1C", "#377EB8",
##D      "#4DAF4A", "#984EA3", "#FF7F00"), each = 5),
##D      pch = rep(0:4, each = 5), ylim = c(-15, 15))
##D Sys.sleep(3)
##D 
##D # Whitening transformation applied to the  chunklets
##D chkTransformed = as.matrix(chks[ , 1:2]) %*% rca(x[ , 1:2], chunks)$A
##D 
##D plot(chkTransformed[ , 1], chkTransformed[ , 2], col = rep(c(
##D      "#E41A1C", "#377EB8", "#4DAF4A", "#984EA3", "#FF7F00"), each = 5),
##D      pch = rep(0:4, each = 5), ylim = c(-15, 15))
##D Sys.sleep(3)
##D 
##D # The origin data after applying the RCA transformation
##D plot(rca(x[ , 1:2], chunks)$newX[, 1], rca(x[ , 1:2], chunks)$newX[, 2],
##D          bg = c("#E41A1C", "#377EB8", "#4DAF4A")[gl(n, k)],
##D          pch = c(rep(22, k), rep(21, k), rep(25, k)))
##D 
##D # The RCA suggested transformation of the data, dimensionality reduced
##D rca(x[ , 1:2], chunks)$A
##D 
##D # The RCA suggested Mahalanobis matrix
##D rca(x[ , 1:2], chunks)$B
## End(Not run)



