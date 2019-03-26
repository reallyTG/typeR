library(TBSSurvival)


### Name: dist.error
### Title: The Wrapper for error distribution functions to use with TBS
### Aliases: dist.error

### ** Examples

  ## this will return list(dcauchy,pcauchy,qcauchy,rcauchy,"cauchy")
  dist = dist.error("cauchy")

  ## a user-built distribution would look like:
  ## dist = list(
  ##         d = function(x,xi) dmydistrib(x,param=xi), # density
  ##         p = function(x,xi) pmydistrib(x,param=xi), # distr
  ##         q = function(x,xi) qmydistrib(x,param=xi), # quantile
  ##         r = function(x,xi) rmydistrib(x,param=xi), # generation
  ##         name = "mydistrib"
  ##        )



