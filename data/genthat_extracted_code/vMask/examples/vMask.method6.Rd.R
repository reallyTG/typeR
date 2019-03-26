library(vMask)


### Name: vMask.method6
### Title: Method 6 for V-Mask Implementation: Using mu0, mu1, sigma, h and
###   w
### Aliases: vMask.method6
### Keywords: CUSUM Control Chart V-mask

### ** Examples

m = 30	#The size of samples
n = 3 	#The size of each subsample
set.seed(2345)
Data = matrix(rnorm(m*n, 0,1), nrow=m)

vMask.method6( data=Data, mu0=0, mu1=1,  h=1, w=2, sl=0 )
vMask.method6( data=Data, mu0=0, mu1=.7, h=1, w=2, sl=0 ) #Compare with the previous line



