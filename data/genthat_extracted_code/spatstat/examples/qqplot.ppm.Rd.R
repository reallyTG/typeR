library(spatstat)


### Name: qqplot.ppm
### Title: Q-Q Plot of Residuals from Fitted Point Process Model
### Aliases: qqplot.ppm
### Keywords: spatial models hplot

### ** Examples

    data(cells)

    fit <- ppm(cells, ~1, Poisson())
    diagnose.ppm(fit)  # no suggestion of departure from stationarity
    ## Not run: qqplot.ppm(fit, 80)  # strong evidence of non-Poisson interaction
    ## Don't show: 
qqplot.ppm(fit, 4)
## End(Don't show)

    ## Not run: 
##D      diagnose.ppm(fit, type="pearson")  
##D      qqplot.ppm(fit, type="pearson")
##D     
## End(Not run)
    ## Don't show: 
qqplot.ppm(fit, 4, type="pearson")
## End(Don't show)

    ###########################################
    ## oops, I need the plot coordinates
    mypreciousdata <- .Last.value
    ## Not run: mypreciousdata <- qqplot.ppm(fit, type="pearson")
    ## Don't show: 
mypreciousdata <- qqplot.ppm(fit, 4, type="pearson")
## End(Don't show)
    plot(mypreciousdata)

    ######################################################
    # Q-Q plots based on fixed n
    # The above QQ plots used simulations from the (fitted) Poisson process.
    # But I want to simulate conditional on n, instead of Poisson
    # Do this by setting rmhcontrol(p=1)
    fixit <- list(p=1)
    ## Not run: qqplot.ppm(fit, 100, control=fixit)
    ## Don't show: 
qqplot.ppm(fit, 4, control=fixit)
## End(Don't show)

    ######################################################
    # Inhomogeneous Poisson data
    X <- rpoispp(function(x,y){1000 * exp(-3*x)}, 1000)
    plot(X)
    # Inhomogeneous Poisson model
    fit <- ppm(X, ~x, Poisson())
    ## Not run: qqplot.ppm(fit, 100)
    ## Don't show: 
qqplot.ppm(fit, 4)
## End(Don't show)
    # conclusion: fitted inhomogeneous Poisson model looks OK

    ######################################################
    # Advanced use of 'expr' argument
    # 
    # set the initial conditions in Metropolis-Hastings algorithm
    # 
    expr <- expression(rmh(fit, start=list(n.start=42), verbose=FALSE))
    ## Not run: qqplot.ppm(fit, 100, expr)
    ## Don't show: 
qqplot.ppm(fit, 4, expr)
## End(Don't show)




