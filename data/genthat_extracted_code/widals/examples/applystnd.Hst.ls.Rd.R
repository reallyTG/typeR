library(widals)


### Name: applystnd.Hst.ls
### Title: Standardize Space-Time Covariates with Existing Object
### Aliases: applystnd.Hst.ls
### Keywords: ~kwd1 ~kwd2

### ** Examples

	
tau <- 20
n.all <- 10
	
Hst.ls.all <- list()
for(tt in 1:tau) {
	Hst.ls.all[[tt]] <- cbind(rnorm(n.all, 1, 0.1), rnorm(n.all, -200, 21))
}

ndx.interp <- c(1,3,5)
ndx.support <- I(1:n.all)[ -ndx.interp ]

Hst.ls <- subsetsites.Hst.ls(Hst.ls.all, ndx.support)

xsnst.obj <- stnd.Hst.ls(Hst.ls)

Hst0.ls <- subsetsites.Hst.ls(Hst.ls.all, ndx.interp)

sHst0.ls <- applystnd.Hst.ls(Hst0.ls, xsnst.obj)



Hst.sumup(xsnst.obj$sHst.ls)

Hst.sumup(sHst0.ls)



## The function is currently defined as
function (Hst0.ls, x) 
{
    tau <- length(Hst0.ls)
    sHst0.ls <- list()
    for (i in 1:tau) {
        sHst0.ls[[i]] <- t((t(Hst0.ls[[i]]) - x$h.mean)/x$h.sd)
    }
    return(sHst0.ls)
  }



