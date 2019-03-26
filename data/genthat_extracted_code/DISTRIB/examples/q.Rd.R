library(DISTRIB)


### Name: q
### Title: Quantile of a distribution
### Aliases: q
### Keywords: pdf rd cdf package stats

### ** Examples

q(p=0.25, T.dist="norm", T.dist.par=c(0,1)) # Or the first Quartile of N(0,1), i.e.  qnorm(0.25)
q(p=1, T.dist="norm", T.dist.par=c(10,2)) # Is equal to  qnorm(1,10,2)
q(0.9, T.dist="cauchy", T.dist.par=c(3,1)) # Is equal to the 9th Decile of Cauchy 
                     # distribution with parameters (3,1); i.e.  qcauchy(0.5,3,1)
q(0.237, T.dist="pois", T.dist.par=25) # Is equal to  qpois(0.237,25)


## The function is currently defined as
function (p, T.dist, T.dist.par) 
{
    qDis = paste("q", T.dist, sep = "", collapse = "")
    if (length(T.dist.par) == 1) {
        q.t = do.call(qDis, list(p, T.dist.par[1]))
    }
    else {
        if (length(T.dist.par) == 2) {
            q.t = do.call(qDis, list(p, T.dist.par[1], T.dist.par[2]))
        }
        else {
            q.t = do.call(qDis, list(p, T.dist.par[1], T.dist.par[2], 
                T.dist.par[3]))
        }
    }
    return(q.t)
  }



