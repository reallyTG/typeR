library(HDclassif)


### Name: predict.hdc
### Title: Prediction method for 'hdc' class objects.
### Aliases: predict.hdc
### Keywords: clustering hdda hddc

### ** Examples

# Example 1:
data <- simuldata(1000, 1000, 50)
X <- data$X
clx <- data$clx
Y <- data$Y
cly <- data$cly

#clustering of the gaussian dataset:
prms1 <- hddc(X, K=3, algo="CEM", init='param')      
          
#class vector obtained by the clustering:
prms1$class                   

# only to see the good classification rate and 
# the Adjusted Rand Index:                     
res1 <- predict(prms1, X, clx)                                            
res2 <- predict(prms1, Y)       

#the class predicted using hddc parameters on the test dataset:  
res2$class                                                           


# Example 2:
data(Crabs)
#clustering of the Crabs dataset:
prms3 <- hddc(Crabs[,-1], K=4, algo="EM", init='kmeans')        
res3 <- predict(prms3, Crabs[,-1], Crabs[,1])







