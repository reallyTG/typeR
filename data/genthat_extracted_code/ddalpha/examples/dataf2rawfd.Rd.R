library(ddalpha)


### Name: dataf2rawfd
### Title: Transform a 'dataf' Object to Raw Functional Data
### Aliases: dataf2rawfd
### Keywords: functional

### ** Examples

## transform a matrix into a functional data set and back
n = 5
d = 21
X = matrix(rnorm(n*d),ncol=d)
R = rawfd2dataf(X,range=c(0,1))
R2 = dataf2rawfd(R,range=c(0,1),d=d)
all.equal(X,R2)

## transform a functional dataset into a raw matrix of functional values
dataf = dataf.population()$dataf
dataf2rawfd(dataf,range=c(1950,2015),d=66)

## transform an array into a multivariate functional data set and back
k = 3
X = array(rnorm(n*d*k),dim=c(n,d,k))
R = rawfd2dataf(X,range=c(-1,1))
dataf2rawfd(R,range=c(-1,1),d=50)




