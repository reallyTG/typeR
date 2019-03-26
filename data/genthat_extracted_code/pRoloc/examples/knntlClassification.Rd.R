library(pRoloc)


### Name: knntlClassification
### Title: knn transfer learning classification
### Aliases: knntlClassification

### ** Examples

## No test: 
library(pRolocdata)
data(andy2011)
data(andy2011goCC)
## reducing calculation time of k by pre-running knnOptimisation
x <- c(andy2011, andy2011goCC)
k <- lapply(x, function(z)
            knnOptimisation(z, times=5,
                            fcol = "markers.orig",
                            verbose = FALSE))
k <- sapply(k, function(z) getParams(z))
k
## reducing parameter search with theta = 1,
## weights of only 1 or 0 will be considered
opt <- knntlOptimisation(andy2011, andy2011goCC,
                         fcol = "markers.orig",
                         times = 2,
                         by = 1, k = k)
opt
th <- getParams(opt)
plot(opt)
res <- knntlClassification(andy2011, andy2011goCC,
                           fcol = "markers.orig", th, k)
res
## End(No test)



