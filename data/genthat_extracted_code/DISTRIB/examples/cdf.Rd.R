library(DISTRIB)


### Name: cdf
### Title: Cumulative density function (cdf)
### Aliases: cdf
### Keywords: pdf rd q package stats

### ** Examples

# Example:
cdf(T.dist="norm", T.dist.par=c(0,1), 0)
cdf(T.dist="t", T.dist.par=c(7), -2)
cdf(T.dist="pois", T.dist.par=5, 0) # Equal to  dpois(0,5)
cdf(T.dist="pois", T.dist.par=5, 5)


## The function is currently defined as
function (T.dist, T.dist.par, t) 
{
    pDis = paste("p", T.dist, sep = "", collapse = "")
    if (length(T.dist.par) == 1) {
        cdf.t = do.call(pDis, list(t, T.dist.par[1]))
    }
    else {
        if (length(T.dist.par) == 2) {
            cdf.t = do.call(pDis, list(t, T.dist.par[1], T.dist.par[2]))
        }
        else {
            cdf.t = do.call(pDis, list(t, T.dist.par[1], T.dist.par[2], 
                T.dist.par[3]))
        }
    }
    return(cdf.t)
  }



