library(spatstat)


### Name: Kdot.inhom
### Title: Inhomogeneous Multitype K Dot Function
### Aliases: Kdot.inhom
### Keywords: spatial nonparametric

### ** Examples

    # Lansing Woods data
    woods <- lansing
    woods <- woods[seq(1,npoints(woods), by=10)]
    ma <- split(woods)$maple
    lg <- unmark(woods)

    # Estimate intensities by nonparametric smoothing
    lambdaM <- density.ppp(ma, sigma=0.15, at="points")
    lambdadot <- density.ppp(lg, sigma=0.15, at="points")
    K <- Kdot.inhom(woods, "maple", lambdaI=lambdaM,
                                      lambdadot=lambdadot)

    # Equivalent
    K <- Kdot.inhom(woods, "maple", sigma=0.15)

    # Fit model
    fit <- ppm(woods ~ marks * polynom(x,y,2))
    K <- Kdot.inhom(woods, "maple", lambdaX=fit, update=FALSE)
    
    # synthetic example: type A points have intensity 50,
    #                    type B points have intensity 50 + 100 * x
    lamB <- as.im(function(x,y){50 + 100 * x}, owin())
    lamdot <- as.im(function(x,y) { 100 + 100 * x}, owin())
    X <- superimpose(A=runifpoispp(50), B=rpoispp(lamB))
    K <- Kdot.inhom(X, "B",  lambdaI=lamB,     lambdadot=lamdot)



