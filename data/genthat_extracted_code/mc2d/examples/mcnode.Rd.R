library(mc2d)


### Name: mcnode
### Title: Build mcnode Objects from Data or other mcnode Objects
### Aliases: mcnode mcdata mcdatanocontrol
### Keywords: methods

### ** Examples

oldvar <- ndvar()
oldunc <- ndunc()
ndvar(3)
ndunc(5)

(x0 <- mcdata(100, type="0"))
mcdata(matrix(100), type="0")

(xV <- mcdata(1:ndvar(), type="V"))
mcdata(matrix(1:ndvar(), ncol=1), type="V")

(xU <- mcdata(10*1:ndunc(), type="U"))
mcdata(matrix(10*1:ndunc(), nrow=1), type="U")

(xVU <- mcdata(1:(ndvar()*ndunc()), type="VU"))
mcdata(matrix(1:(ndvar()*ndunc()), ncol=5, nrow=3), type="VU")

##Do not use
## Not run: 
##D mcdata(matrix(1:5, nrow=1), type="VU")
## End(Not run)
##use instead
mcdata(mcdata(matrix(1:ndunc(), nrow=1), type="U"), "VU")
##or
mcdata(matrix(1:ndunc(), nrow=1), type="U") + mcdata(0, "VU")

mcdata(x0, type="0")

mcdata(x0, type="V")
mcdata(xV, type="V")

mcdata(x0, type="U")
mcdata(xU, type="U")

mcdata(x0, type="VU")
mcdata(xU, type="VU")
mcdata(xV, type="VU")

##Multivariates
(x0M <- mcdata(1:2, type="0", nvariates=2))
mcdata(1, type="0", nvariates=2)

(xVM <- mcdata(1:(2*ndvar()), type="V", nvariates=2))
mcdata(1:ndvar(), type="V", nvariates=2)
mcdata(array(1:(2*ndvar()), dim=c(3, 1, 2)), type="V", nvariates=2)

mcdata(1, type="V", nvariates=2)
mcdata(x0, type="V", nvariates=2)
mcdata(x0M, type="V", nvariates=2)
mcdata(xV, type="V", nvariates=2)
mcdata(xVM, type="V", nvariates=2)

(xUM <- mcdata(10*(1:(2*ndunc())), type="U", nvariates=2))
mcdata(array(10*(1:(2*ndunc())), dim=c(1, 5, 2)), type="U", nvariates=2)

mcdata(1, type="U", nvariates=2)
mcdata(x0, type="U", nvariates=2)
mcdata(x0M, type="U", nvariates=2)
mcdata(xU, type="U", nvariates=2)
mcdata(xUM, type="U", nvariates=2)

(xVUM <- mcdata(1:(ndvar()*ndunc()), type="VU", nvariates=2))
mcdata(array(1:(ndvar()*ndunc()), dim=c(3, 5, 2)), type="VU", nvariates=2)

mcdata(1, type="VU", nvariates=2)
mcdata(x0, type="VU", nvariates=2)
mcdata(x0M, type="VU", nvariates=2)
mcdata(xV, type="VU", nvariates=2)
mcdata(xVM, type="VU", nvariates=2)
mcdata(xU, type="VU", nvariates=2)
mcdata(xUM, type="VU", nvariates=2)
mcdata(xVU, type="VU", nvariates=2)
mcdata(xVUM, type="VU", nvariates=2)

ndvar(oldvar)
ndunc(oldunc)




