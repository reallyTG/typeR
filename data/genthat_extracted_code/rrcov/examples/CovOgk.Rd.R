library(rrcov)


### Name: CovOgk
### Title: Robust Location and Scatter Estimation - Ortogonalized
###   Gnanadesikan-Kettenring (OGK)
### Aliases: CovOgk
### Keywords: robust multivariate

### ** Examples

data(hbk)
hbk.x <- data.matrix(hbk[, 1:3])
CovOgk(hbk.x)

## the following three statements are equivalent
c1 <- CovOgk(hbk.x, niter=1)
c2 <- CovOgk(hbk.x, control = CovControlOgk(niter=1))

## direct specification overrides control one:
c3 <- CovOgk(hbk.x, beta=0.95,
             control = CovControlOgk(beta=0.99))
c1

x<-matrix(c(1,2,3,7,1,2,3,7), ncol=2)
##  CovOgk(x)   - this would fail because the two columns of x are exactly collinear.
##              In order to fix it, redefine the default 'vrob' function for example
##              in the following way and pass it as a parameter in the control
##              object.
cc <- CovOgk(x, control=new("CovControlOgk",
                            vrob=function(x1, x2, ...)
                            {
                                r <- .vrobGK(x1, x2, ...)
                                if(is.na(r))
                                    r <- 0
                                r
                            })
)
cc



