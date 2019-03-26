library(SPA3G)


### Name: PROJECT
### Title: Column-wise Mean Centered
### Aliases: PROJECT

### ** Examples


## The function is currently defined as
function (MM) 
{
    PMM <- MM - (matrix(1, n, 1) %*% apply(MM, 2, sum))/n
    return(PMM)
  }



