library(MaxSkew)


### Name: MaxSkew-package
### Title: MaxSkew: skewness-based projection pursuit
### Aliases: MaxSkew-package
### Keywords: package

### ** Examples

## Example 1. Run MaxSkew on the iris data 
data(iris)
iris<-data.matrix(iris) #returns the matrix obtained by converting the data frame to numeric mode
MaxSkew(iris[,1:3],5,2,FALSE) # matrix whose columns are the two projections with maximal skewness
MaxSkew(iris[,1:2],5,1,FALSE) #projection with maximal skewness of the first two variables
#MaxSkewBiv(iris[,1],iris[,2]) #obtains the same of MaxSkew(iris[,1:2],5,1)

## Example 2. Run MaxSkew on the OLYMPIC_DECATHLON_2016 data 
data(OLYMPIC_DECATHLON_2016)
OLYMPIC_DECATHLON_2016_matrix<-data.matrix(OLYMPIC_DECATHLON_2016) #returns a data matrix
MaxSkew(OLYMPIC_DECATHLON_2016_matrix[,4:13],10,2,TRUE) #it returns also the scatterplot
MaxSkew(OLYMPIC_DECATHLON_2016_matrix[,4:13],10,2,FALSE)#as in example 1

OLYMPIC_DECATHLON_2016_projections<-MaxSkew(OLYMPIC_DECATHLON_2016_matrix[,4:13],10,2,FALSE)
plot(OLYMPIC_DECATHLON_2016_projections) #scatterplot of the first two projections
##install.packages("calibrate")
##library(calibrate)
##textxy(OLYMPIC_DECATHLON_2016_projections[,1],OLYMPIC_DECATHLON_2016_projections[,2],
##OLYMPIC_DECATHLON_2016$ATHLETE,offset=0.5)



