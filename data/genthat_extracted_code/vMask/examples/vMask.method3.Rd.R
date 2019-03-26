library(vMask)


### Name: vMask.method3
### Title: Method 3 for V-Mask Implementation: Using mu0, k, alpha and beta
### Aliases: vMask.method3
### Keywords: CUSUM Control Chart V-mask

### ** Examples

m = 26	#The size of samples
n = 2 	#The size of each subsample
set.seed(2345)
Data = matrix(rnorm(m*n, 0,1), nrow=m)
head(Data)

vMask.method3( data=Data, k=1, alpha=.1, beta=.01, s=0 )
vMask.method3( data=Data, k=1, alpha=.2, beta=.01, s=0 )    #Compare with the previous line
vMask.method3( data=Data, k=1, alpha=.2, s=0 )		    #Result is same, by default beta=.001



