library(DLASSO)


### Name: dlasso
### Title: An implementation of dlasso using iterative ridge algorithm
### Aliases: dlasso
### Keywords: "dlasso"

### ** Examples

    # dLASSO
    r = 5
    zr= 95
    n = 50
    b = c(1:r,rep(0,zr))
    x = matrix(rnorm((r+zr)*n),ncol=r+zr)
    y = x %*% b +rnorm(n)
    dLasso = dlasso(x=x,y=y,adp=TRUE)
    plot(dLasso,label=.1,cex=.80,all = 1)
    coef(dLasso)
    # dSCAD
    dscad = dlasso(x=x,y=y,c=-1,adj=50)
    plot(dscad,label=.1,cex=.80,all = 1)
    coef(dscad)




