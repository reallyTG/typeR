library(vMask)


### Name: vMask.method4
### Title: Method 4 for V-Mask Implementation: Using mu0, k, h and w
### Aliases: vMask.method4
### Keywords: CUSUM Control Chart V-mask

### ** Examples

m = 35	#The size of samples
n = 2 	#The size of each subsample
set.seed(1234)
Data = matrix(rnorm(m*n, 0,1), nrow=m)
head(Data)

vMask.method4( data=Data, s=0 )
vMask.method4( data=Data, k=.3, h=2.5, w=1, s=0 )
vMask.method4( data=Data, k=.3, h=2.5, w=2, s=0 ) #Compare with the previous line



