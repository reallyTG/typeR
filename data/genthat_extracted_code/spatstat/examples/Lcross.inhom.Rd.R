library(spatstat)


### Name: Lcross.inhom
### Title: Inhomogeneous Cross Type L Function
### Aliases: Lcross.inhom
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
    L <- Lcross.inhom(woods, "whiteoak", "maple", lambdaW, lambdaM)

    # method (2): fit parametric intensity model
    fit <- ppm(woods ~marks * polynom(x,y,2))
    # evaluate fitted intensities at data points
    # (these are the intensities of the sub-processes of each type)
    inten <- fitted(fit, dataonly=TRUE)
    # split according to types of points
    lambda <- split(inten, marks(woods))
    L <- Lcross.inhom(woods, "whiteoak", "maple",
              lambda$whiteoak, lambda$maple)
    
    # synthetic example: type A points have intensity 50,
    #                    type B points have intensity 100 * x
    lamB <- as.im(function(x,y){50 + 100 * x}, owin())
    X <- superimpose(A=runifpoispp(50), B=rpoispp(lamB))
    L <- Lcross.inhom(X, "A", "B",
        lambdaI=as.im(50, Window(X)), lambdaJ=lamB)



