library(widals)


### Name: applystnd.Hs
### Title: Standardize Spacial Covariates with Existing Object
### Aliases: applystnd.Hs
### Keywords: ~kwd1 ~kwd2

### ** Examples


n.all <- 21
Hs.all <- cbind(1, rnorm(n.all, 1, 0.1), rnorm(n.all, -200, 21))

ndx.interp <- c(1,3,5)
ndx.support <- I(1:n.all)[ -ndx.interp ]


Hs <- Hs.all[ndx.support, , drop=FALSE]

xsns.obj <- stnd.Hs(Hs)

Hs0 <- Hs.all[ndx.interp, , drop=FALSE]

sHs0 <- applystnd.Hs(Hs0, xsns.obj)
sHs0

xsns.obj$sHs

crossprod(xsns.obj$sHs) / nrow(Hs)

crossprod(sHs0) / nrow(sHs0)


## The function is currently defined as
function (Hs0, x) 
{
    sHs0 <- t((t(Hs0) - x$h.mean)/x$h.sd)
    if (x$intercept) {
        sHs0[, 1] <- 1/sqrt(x$n)
    }
    return(sHs0)
  }



