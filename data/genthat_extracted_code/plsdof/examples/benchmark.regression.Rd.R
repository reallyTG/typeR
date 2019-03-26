library(plsdof)


### Name: benchmark.regression
### Title: Comparison of Partial Least Squares Regression, Principal
###   Components Regression and Ridge Regression.
### Aliases: benchmark.regression
### Keywords: multivariate

### ** Examples

## No test: 
# Boston Housing data
library(MASS)
data(Boston)
X<-as.matrix(Boston[,1:4]) # select the first 3 columns as predictor variables
y<-as.vector(Boston[,14])

my.benchmark<-benchmark.regression(X,y,ratio=0.5,R=10,k=5)

# boxplot of the mean squared error

boxplot(my.benchmark$MSE,outline=FALSE)

# boxplot of the degrees of freedom, without the null model

boxplot(my.benchmark$DoF[,-4])
## End(No test)



