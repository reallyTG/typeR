library(spatstat)


### Name: diagnose.ppm
### Title: Diagnostic Plots for Fitted Point Process Model
### Aliases: diagnose.ppm plot.diagppm
### Keywords: spatial models hplot

### ** Examples

    fit <- ppm(cells ~x, Strauss(r=0.15))
    diagnose.ppm(fit)
    ## Not run: 
##D     diagnose.ppm(fit, type="pearson")
##D     
## End(Not run)

    diagnose.ppm(fit, which="marks")

    diagnose.ppm(fit, type="raw", plot.neg="discrete")

    diagnose.ppm(fit, type="pearson", which="smooth")

    # save the diagnostics and plot them later
    u <- diagnose.ppm(fit, rbord=0.15, plot.it=FALSE)
    ## Not run: 
##D     plot(u)
##D     plot(u, which="marks")
##D     
## End(Not run)



