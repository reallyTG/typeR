library(mro)


### Name: mcr
### Title: Multiple Correlation
### Aliases: mcr

### ** Examples


## Example 1:
mcr(iris[,-5],1,c(2,3,4))  ## Returns multiple correlation between Sepal.Length
                          ## and the other variables

## Example 2
mu<-c(10,12,13,14)
sig<-matrix(0,4,4)
diag(sig)<-c(2,1,1,3)
da<-MASS::mvrnorm(25,mu,sig)
mcr(da, 2,c(1,3,4))       ## Returns Multiple correlation when the data matrix
                          ## simulated from a quadrivariate normal distribution
                          ## is given as input

## Example 3
da<-var(iris[,-5])
mcr(da,3,c(1,2,4),FALSE) ## Returns multiple correlation between Petal.Width
                         ## and the other variables when the correlation matrix
                         ## is given as input




