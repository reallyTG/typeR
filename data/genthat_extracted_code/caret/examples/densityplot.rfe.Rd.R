library(caret)


### Name: densityplot.rfe
### Title: Lattice functions for plotting resampling results of recursive
###   feature selection
### Aliases: densityplot.rfe xyplot.rfe stripplot.rfe histogram.rfe
### Keywords: hplot

### ** Examples


## Not run: 
##D library(mlbench)
##D n <- 100
##D p <- 40
##D sigma <- 1
##D set.seed(1)
##D sim <- mlbench.friedman1(n, sd = sigma)
##D x <- cbind(sim$x,  matrix(rnorm(n * p), nrow = n))
##D y <- sim$y
##D colnames(x) <- paste("var", 1:ncol(x), sep = "")
##D 
##D normalization <- preProcess(x)
##D x <- predict(normalization, x)
##D x <- as.data.frame(x)
##D subsets <- c(10, 15, 20, 25)
##D 
##D ctrl <- rfeControl(
##D                    functions = lmFuncs,
##D                    method = "cv",
##D                    verbose = FALSE,
##D                    returnResamp = "all")
##D 
##D lmProfile <- rfe(x, y,
##D                  sizes = subsets,
##D                  rfeControl = ctrl)
##D xyplot(lmProfile)
##D stripplot(lmProfile)
##D 
##D histogram(lmProfile)
##D densityplot(lmProfile)
## End(Not run)




