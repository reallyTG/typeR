library(vMask)


### Name: vMask.method2
### Title: Method 2 for V-Mask Implementation: Using mu0, d and h
### Aliases: vMask.method2
### Keywords: CUSUM Control Chart V-mask

### ** Examples

### Example 1:
m = 15	#The size of samples
n = 4 	#The size of each subsample
set.seed(100)
Data = matrix(rnorm(m*n, 2,5), nrow=m)
head(Data)

vMask.method2( data=Data, d=1, h=1, s=0 )
( res <- vMask.method2( data=Data, mu0=2, d=2, h=2, sl=0) )
Data[res$Out,]	#Out of control subsamples


### Example 2:
vMask.method2( data=Data, d=1, h=1, s=0 )
vMask.method1( data=Data, d=1, theta=45, s=0 )  #Similar results



