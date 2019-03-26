library(SpatialVS)


### Name: small.test.dat
### Title: A small dataset for fast testing of functions
### Aliases: small.test.dat
### Keywords: dataset

### ** Examples

data("small.test")

#Here is a toy example for creating a data object that can be used for
#generating dat.obj for SpatialVS function
n=20
#simulate counts data
y=rpois(n=n, lambda=1)
#simulate covariate matrix
x1=rnorm(n)
x2=rnorm(n)
X=cbind(1, x1, x2)
#compute distance matrix from some simulated locations
loc_x=runif(n)
loc_y=runif(n)
dist=matrix(0,n, n)
for(i in 1:n)
{
  for(j in 1:n)
  {
    dist[i,j]=sqrt((loc_x[i]-loc_x[j])^2+(loc_y[i]-loc_y[j])^2)
  }
}

#assume offset is all zero
offset=rep(0, n)

#assemble the data object for SpatialVS

dat.obj=list(y=y, X=X, dist=dist, offset=offset)





