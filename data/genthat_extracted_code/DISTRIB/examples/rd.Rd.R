library(DISTRIB)


### Name: rd
### Title: Compute random data from a distribution
### Aliases: rd
### Keywords: pdf cdf q package stats

### ** Examples

rd(n=10, T.dist="norm", T.dist.par=c(0,1)) # Is equal to  rnorm(10)
rd(25, T.dist="pois", T.dist.par=3.3) # Is equal to  rpois(25,3.3)

## The function is currently defined as
function (n, T.dist, T.dist.par) 
{
    rDis = paste("r", T.dist, sep = "", collapse = "")
    if (length(T.dist.par) == 1) {
        rd.t = do.call(rDis, list(n, T.dist.par[1]))
    }
    else {
        if (length(T.dist.par) == 2) {
            rd.t = do.call(rDis, list(n, T.dist.par[1], T.dist.par[2]))
        }
        else {
            rd.t = do.call(rDis, list(n, T.dist.par[1], T.dist.par[2], 
                T.dist.par[3]))
        }
    }
    return(rd.t)
  }



