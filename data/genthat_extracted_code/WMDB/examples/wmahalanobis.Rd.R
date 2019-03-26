library(WMDB)


### Name: wmahalanobis
### Title: Compute weighted Mahalanobis distance
### Aliases: wmahalanobis

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.
x=iris[1:50,1:4]
center=colMeans(x)
cov=var(x)
weight=diag(rep(0.25,4))
wmahalanobis(x,center,cov,weight)

## The function is currently defined as
function (x, center, cov, weight) 
{
    if (is.vector(x)) 
        x = matrix(x, ncol = length(x))
    else x=as.matrix(x)
    x <- sweep(x, 2, center)
    cov <- weight %*% solve(cov)
    retval <- diag(x %*% cov %*% t(x))
    retval
  }



