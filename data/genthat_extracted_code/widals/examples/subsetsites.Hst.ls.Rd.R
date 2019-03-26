library(widals)


### Name: subsetsites.Hst.ls
### Title: Site-Wise Extract Space-Time Covariates
### Aliases: subsetsites.Hst.ls
### Keywords: ~kwd1 ~kwd2

### ** Examples

	
tau <- 70
n <- 28

Hst.ls <- list()
for(i in 1:tau) { Hst.ls[[i]] <- matrix(rnorm(n*4), nrow=n) }

subsetsites.Hst.ls(Hst.ls, c(1,3,10))


subsetsites.Hst.ls(Hst.ls, c(TRUE, TRUE, rep(FALSE, n-2)))


## The function is currently defined as
function (Hst.ls, xmask) 
{
    tau <- length(Hst.ls)
    Hst.ls.out <- list()
    for (i in 1:tau) {
        Hst.ls.out[[i]] <- Hst.ls[[i]][xmask, , drop = FALSE]
    }
    return(Hst.ls.out)
  }



