library(psych)


### Name: mardia
### Title: Calculate univariate or multivariate (Mardia's test) skew and
###   kurtosis for a vector, matrix, or data.frame
### Aliases: mardia skew kurtosi
### Keywords: multivariate models

### ** Examples

round(skew(attitude),2)   #type 3 (default)
round(kurtosi(attitude),2)  #type 3 (default)
#for the differences between the three types of skew and kurtosis:
round(skew(attitude,type=1),2)  #type 1
round(skew(attitude,type=2),2)  #type 2 
mardia(attitude)
x <- matrix(rnorm(1000),ncol=10)
describe(x)
mardia(x)



