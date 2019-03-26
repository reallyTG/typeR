library(biglasso)


### Name: biglasso-package
### Title: Extending Lasso Model Fitting to Big Data
### Aliases: biglasso-package
### Keywords: package

### ** Examples

## Not run: 
##D ## Example of reading data from external big data file, fit lasso model, 
##D ## and run cross validation in parallel
##D 
##D # simulated design matrix, 1000 observations, 500,000 variables, ~ 5GB
##D # there are 10 true variables with non-zero coefficient 2.
##D xfname <- 'x_e3_5e5.txt' 
##D yfname <- 'y_e3_5e5.txt' # response vector
##D time <- system.time(
##D   X <- setupX(xfname, sep = '\t') # create backing files (.bin, .desc)
##D )
##D print(time) # ~ 7 minutes; this is just one-time operation
##D dim(X)
##D 
##D # the big.matrix then can be retrieved by its descriptor file (.desc) in any new R session. 
##D rm(X)
##D xdesc <- 'x_e3_5e5.desc' 
##D X <- attach.big.matrix(xdesc)
##D dim(X)
##D 
##D y <- as.matrix(read.table(yfname, header = F))
##D time.fit <- system.time(
##D   fit <- biglasso(X, y, family = 'gaussian', screen = 'SSR-BEDPP')
##D )
##D print(time.fit) # ~ 44 seconds for fitting a lasso model along the entire solution path
##D 
##D # cross validation in parallel
##D seed <- 1234
##D time.cvfit <- system.time(
##D   cvfit <- cv.biglasso(X, y, family = 'gaussian', screen = 'SSR-BEDPP', 
##D                        seed = seed, ncores = 4, nfolds = 10)
##D )
##D print(time.cvfit) # ~ 3 minutes for 10-fold cross validation
##D plot(cvfit)
##D summary(cvfit)
## End(Not run)




