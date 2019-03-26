library(SDMTools)


### Name: COGravity
### Title: Centre of Gravity or Mass calculations for spatial data
### Aliases: COGravity

### ** Examples

#create some points
x = seq(154,110,length=25)
y = seq(-10,-54,length=25)
z = seq(100,200,length=25)
wt = runif(25) #random weights
#calculate the Centre of Gravity for these points
COGravity(x,y,z,wt)

#create a simple objects of class 'asc'
x = as.asc(matrix(1:50,nr=50,nc=50))
wt = as.asc(matrix(runif(50),nr=50,nc=50))

#calculate COG with weighting defined in x
COGravity(x)
#calculate COG with weighting defined in wt (values in x are assumed elevation (z))
COGravity(x,wt=wt)



