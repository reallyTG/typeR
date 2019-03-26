library(locpol)


### Name: locpol
### Title: Local Polynomial estimation.
### Aliases: locpol confInterval residuals.locpol fitted.locpol
###   summary.locpol print.locpol plot.locpol
### Keywords: nonparametric smooth

### ** Examples

    N <- 250
    xeval <- 0:100/100
    ##  ex1
    d <- data.frame(x = runif(N))
    d$y <- d$x^2 - d$x + 1 + rnorm(N, sd = 0.1)
    r <- locpol(y~x,d)
    plot(r)
    ##  ex2
    d <- data.frame(x = runif(N))
    d$y <- d$x^2 - d$x + 1 + (1+d$x)*rnorm(N, sd = 0.1)
    r <- locpol(y~x,d)
    plot(r)
    ## notice:
    rr <- locpol(y~x,d,xeval=runif(50,-1,1))  
    ## notice x has null dens. outside (0,1)
    ## plot(rr) raises an error, no conf. bands outside (0,1).
    ## length biased data !!
    d <- data.frame(x = runif(10*N))
    d$y <- d$x^2 - d$x + 1 + (rexp(10*N,rate=4)-.25)
    posy <- d$y[ whichYPos <- which(d$y>0) ];
    d <- d[sample(whichYPos, N,prob=posy,replace=FALSE),]
    rBiased <- locpol(y~x,d)
    r <- locpol(y~x,d,weig=1/d$y)
    plot(d)
    points(r$lpFit[,r$X],r$lpFit[,r$Y],type="l",col="blue")
    points(rBiased$lpFit[,rBiased$X],rBiased$lpFit[,rBiased$Y],type="l")
    curve(x^2 - x + 1,add=TRUE,col="red")
     



