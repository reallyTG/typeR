library(vMask)


### Name: vMask.method1
### Title: Method 1 for V-Mask Implementation: Using mu0, d and theta
### Aliases: vMask.method1
### Keywords: CUSUM Control Chart V-mask

### ** Examples

### Example 1: (Data matrix)
m = 10	#The size of samples
n = 3 	#The size of each subsample
set.seed(123)
Data = matrix(rnorm(m*n, 1.5,3), nrow=m)
head(Data, 4)

vMask.method1( data=Data, d=4, theta=30, sleep="PressEnter")
vMask.method1( data=Data, d=4, theta=30, sleep=0)    #Check with sleep=1
vMask.method1( data=Data, d=4.5, theta=30, sleep=0)
vMask.method1( data=Data, mu0=0, d=4.5, theta=45, sl=0)

### Example 2: (Vectoral data) 
set.seed(123)
vMask.method1( data=rnorm(20, 1,2), mu0=0, d=8, theta=45, sl=0)



