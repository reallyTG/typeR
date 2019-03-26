library(spatstat)


### Name: Ldot.inhom
### Title: Inhomogeneous Multitype L Dot Function
### Aliases: Ldot.inhom
### Keywords: spatial nonparametric

### ** Examples

    # Lansing Woods data
    lan <- lansing
    lan <- lan[seq(1,npoints(lan), by=10)]
    ma <- split(lan)$maple
    lg <- unmark(lan)

    # Estimate intensities by nonparametric smoothing
    lambdaM <- density.ppp(ma, sigma=0.15, at="points")
    lambdadot <- density.ppp(lg, sigma=0.15, at="points")
    L <- Ldot.inhom(lan, "maple", lambdaI=lambdaM,
                                  lambdadot=lambdadot)


    # synthetic example: type A points have intensity 50,
    #                    type B points have intensity 50 + 100 * x
    lamB <- as.im(function(x,y){50 + 100 * x}, owin())
    lamdot <- as.im(function(x,y) { 100 + 100 * x}, owin())
    X <- superimpose(A=runifpoispp(50), B=rpoispp(lamB))
    L <- Ldot.inhom(X, "B",  lambdaI=lamB,     lambdadot=lamdot)



