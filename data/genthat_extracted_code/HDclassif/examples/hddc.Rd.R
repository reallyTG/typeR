library(HDclassif)


### Name: hddc
### Title: High Dimensional Data Clustering
### Aliases: hddc

### ** Examples

# Example 1:
data <- simuldata(1000, 1000, 50)
X <- data$X
clx <- data$clx
Y <- data$Y
cly <- data$cly

#clustering of the simulated dataset:
prms1 <- hddc(X, K=3, algo="CEM", init='param')                

#class vector obtained by the clustering:
prms1$class                

#We can look at the adjusted rand index to assess the goodness of fit
res1 <- predict(prms1, X, clx)
res2 <- predict(prms1, Y)       
#the class predicted using hddc parameters on the test dataset:  
res2$class                                                           


# Example 2:
data(Crabs)

# clustering of the Crabs dataset:
prms3 <- hddc(Crabs[,-1], K=4, algo="EM", init='mini-em')        
res3 <- predict(prms3, Crabs[,-1], Crabs[,1])

# another example using the Crabs dataset
prms4 <- hddc(Crabs[,-1], K=1:8, model=c(1,2,7,9))

# model=c(1,2,7,9) is equivalent to:
# model=c("AKJBKQKDK","AKBKQKDK","AKJBKQKD"#' ,"ABKQKD") 
res4 <- predict(prms4, Crabs[,-1], Crabs[,1])

# PARALLEL COMPUTING
## Not run: 
##D # Same example but with Parallel Computing => platform specific
##D # (slower for Windows users)
##D # To enable it, just use the argument 'mc.cores'
##D prms5 <- hddc(Crabs[,-1], K=1:8, model=c(1,2,7,9), mc.cores=2)
## End(Not run)

# LARGE DATASETS
# Assume you have a very large data set 
# => you can use the argument 'subset' to obtain quick results:
## Not run: 
##D # we take a subset of 10000 observations and run hddc
##D # once the classification is done, the posterior is computed 
##D # on the full data
##D prms = hddc(bigData, subset = 10000)
##D # You obtain a (much faster) classification of the full dataset:
##D table(prms$class)
## End(Not run)





