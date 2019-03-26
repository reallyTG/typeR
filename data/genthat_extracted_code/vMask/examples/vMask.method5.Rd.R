library(vMask)


### Name: vMask.method5
### Title: Method 5 for V-Mask Implementation: Using mu0, mu1, sigma, alpha
###   and beta
### Aliases: vMask.method5
### Keywords: CUSUM Control Chart V-mask

### ** Examples

m = 26	#The size of samples
n = 2 	#The size of each subsample
set.seed(2345)
Data = matrix(rnorm(m*n, 0,1), nrow=m)
head(Data)

vMask.method5( data=Data, mu0=0, mu1=1,  alpha=.1, beta=.01, sl=0 )
vMask.method5( data=Data, mu0=0, mu1=.5, alpha=.1, beta=.01, sl=0 )



