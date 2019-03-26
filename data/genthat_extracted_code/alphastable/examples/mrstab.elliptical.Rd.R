library(alphastable)


### Name: mrstab.elliptical
### Title: mrstab.elliptical
### Aliases: mrstab.elliptical

### ** Examples

# In the following example, we simulate n=200 iid vectors of a two-dimensional elliptically
# contoured stable distribution with parameters alpha=1.3, Sigma=matrix(c(1,.5,.5,1),2,2),
# and mu=(0,0)^T.
library("mvtnorm")
library("stabledist")
mrstab.elliptical(200,1.3,matrix(c(1,.5,.5,1),ncol=2,nrow=2),c(0,0))



