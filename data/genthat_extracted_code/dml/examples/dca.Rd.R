library(dml)


### Name: dca
### Title: Discriminative Component Analysis
### Aliases: dca
### Keywords: component dca discriminant mahalanobis metric transformation

### ** Examples

## Not run: 
##D set.seed(123)
##D require(MASS)  # generate synthetic Gaussian data
##D k = 100        # sample size of each class
##D n = 3          # specify how many class
##D N = k * n      # total sample number
##D x1 = mvrnorm(k, mu = c(-10, 6), matrix(c(10, 4, 4, 10), ncol = 2))
##D x2 = mvrnorm(k, mu = c(0, 0), matrix(c(10, 4, 4, 10), ncol = 2))
##D x3 = mvrnorm(k, mu = c(10, -6), matrix(c(10, 4, 4, 10), ncol = 2))
##D data = as.data.frame(rbind(x1, x2, x3))
##D # The fully labeled data set with 3 classes
##D plot(data$V1, data$V2, bg = c("#E41A1C", "#377EB8", "#4DAF4A")[gl(n, k)],
##D      pch = c(rep(22, k), rep(21, k), rep(25, k)))
##D Sys.sleep(3)
##D # Same data unlabeled; clearly the classes' structure is less evident
##D plot(x$V1, x$V2)
##D Sys.sleep(3)
##D 
##D chunk1 = sample(1:100, 5)
##D chunk2 = sample(setdiff(1:100, chunk1), 5)
##D chunk3 = sample(101:200, 5)
##D chunk4 = sample(setdiff(101:200, chunk3), 5)
##D chunk5 = sample(201:300, 5)
##D chks = list(chunk1, chunk2, chunk3, chunk4, chunk5)
##D chunks = rep(-1, 300)
##D # positive samples in the chunks
##D for (i in 1:5) {
##D   for (j in chks[[i]]) {
##D     chunks[j] = i
##D   }
##D }
##D 
##D # define the negative constrains between chunks
##D neglinks = matrix(c(
##D 		0, 0, 1, 1, 1,
##D 		0, 0, 1, 1, 1,
##D 		1, 1, 0, 0, 0,
##D 		1, 1, 0, 0, 1,
##D 		1, 1, 1, 1, 0),
##D 		ncol = 5, byrow = TRUE)
##D 
##D dcaData = dca(data = data, chunks = chunks, neglinks = neglinks)$newData
##D # plot DCA transformed data
##D plot(dcaData[, 1], dcaData[, 2], bg = c("#E41A1C", "#377EB8", "#4DAF4A")[gl(n, k)],
##D      pch = c(rep(22, k), rep(21, k), rep(25, k)),
##D      xlim = c(-15, 15), ylim = c(-15, 15))
## End(Not run)



