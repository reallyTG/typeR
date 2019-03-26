library(SHT)


### Name: mean2.2014Thulin
### Title: Two-sample Test for Multivariate Means by Thulin (2014)
### Aliases: mean2.2014Thulin

### ** Examples

## CRAN-purpose small example
smallX = matrix(rnorm(10*3),ncol=10)
smallY = matrix(rnorm(10*3),ncol=10)
mean2.2014Thulin(smallX, smallY, B=10, nreps=10) # run the test

## No test: 
## Compare with 'mean2.2011LJW' 
## which is based on random projection.
n = 33    # number of observations for each sample
p = 100   # dimensionality

X = matrix(rnorm(n*p), ncol=p)
Y = matrix(rnorm(n*p), ncol=p)

## run both methods with 100 permutations
mean2.2011LJW(X,Y,nreps=100,method="m")  # 2011LJW requires 'm' to be set.
mean2.2014Thulin(X,Y,nreps=100)
## End(No test)




