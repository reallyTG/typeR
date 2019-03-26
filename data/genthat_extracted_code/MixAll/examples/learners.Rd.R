library(MixAll)


### Name: learnDiagGaussian
### Title: Create an instance of a learn mixture model
### Aliases: learnDiagGaussian learnPoisson learnGamma learnCategorical

### ** Examples


## A quantitative example with the famous iris data set
data(iris)

## get data and target
x <- as.matrix(iris[,1:4]);
z <- as.vector(iris[,5]);
n <- nrow(x); p <- ncol(x);

## add missing values at random
indexes <- matrix(c(round(runif(5,1,n)), round(runif(5,1,p))), ncol=2);
x[indexes] <- NA;

## learn model
model <- learnDiagGaussian( data=x, labels= z, prop = c(1/3,1/3,1/3)
                          , models = clusterDiagGaussianNames(prop = "equal")
                          )

## get summary
summary(model)

## use graphics functions
## Not run: 
##D plot(model)
## End(Not run)
## print model
## Not run: 
##D print(model)
## End(Not run)

## get estimated missing values
missingValues(model)




