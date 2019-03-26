library(DISTRIB)


### Name: pdf
### Title: Probability density function (pdf) and probability mass function
###   (pmf)
### Aliases: pdf
### Keywords: cdf rd q package stats

### ** Examples

pdf(T.dist="norm", T.dist.par=c(0,1), t=0) # Is equal to  dnorm(0)
pdf(T.dist="t", T.dist.par=c(7), -2) # Is equal to  dt(-2,7)
pdf(T.dist="pois", T.dist.par=5, 5) # Is equal to  dpois(5,5)


## The function is currently defined as
function (T.dist, T.dist.par, t) 
{
    dDis = paste("d", T.dist, sep = "", collapse = "")
    if (length(T.dist.par) == 1) {
        pdf.t = do.call(dDis, list(t, T.dist.par[1]))
    }
    else {
        if (length(T.dist.par) == 2) {
            pdf.t = do.call(dDis, list(t, T.dist.par[1], T.dist.par[2]))
        }
        else {
            pdf.t = do.call(dDis, list(t, T.dist.par[1], T.dist.par[2], 
                T.dist.par[3]))
        }
    }
    return(pdf.t)
  }



