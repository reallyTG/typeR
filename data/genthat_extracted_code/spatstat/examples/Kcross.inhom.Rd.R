library(spatstat)


### Name: Kcross.inhom
### Title: Inhomogeneous Cross K Function
### Aliases: Kcross.inhom
### Keywords: spatial nonparametric

### ** Examples

    # Lansing Woods data
    woods <- lansing
    ## Don't show: 
woods <- woods[seq(1,npoints(woods), by=10)]
## End(Don't show)
    ma <- split(woods)$maple
    wh <- split(woods)$whiteoak

    # method (1): estimate intensities by nonparametric smoothing
    lambdaM <- density.ppp(ma, sigma=0.15, at="points")
    lambdaW <- density.ppp(wh, sigma=0.15, at="points")
    K <- Kcross.inhom(woods, "whiteoak", "maple", lambdaW, lambdaM)

    # method (2): leave-one-out
    K <- Kcross.inhom(woods, "whiteoak", "maple", sigma=0.15)

    # method (3): fit parametric intensity model
    fit <- ppm(woods ~marks * polynom(x,y,2))
    # alternative (a): use fitted model as 'lambda' argument
    K <- Kcross.inhom(woods, "whiteoak", "maple",
                      lambdaI=fit, lambdaJ=fit, update=FALSE)
    K <- Kcross.inhom(woods, "whiteoak", "maple",
                      lambdaX=fit, update=FALSE)
    # alternative (b): evaluate fitted intensities at data points
    # (these are the intensities of the sub-processes of each type)
    inten <- fitted(fit, dataonly=TRUE)
    # split according to types of points
    lambda <- split(inten, marks(woods))
    K <- Kcross.inhom(woods, "whiteoak", "maple",
              lambda$whiteoak, lambda$maple)
    
    # synthetic example: type A points have intensity 50,
    #                    type B points have intensity 100 * x
    lamB <- as.im(function(x,y){50 + 100 * x}, owin())
    X <- superimpose(A=runifpoispp(50), B=rpoispp(lamB))
    K <- Kcross.inhom(X, "A", "B",
        lambdaI=as.im(50, Window(X)), lambdaJ=lamB)



