library(xergm.common)


### Name: alliances
### Title: Longitudinal international defense alliance network, 1981-2000
### Aliases: alliances allyNet contigMat lNet LSP warNet
### Keywords: datasets

### ** Examples

## Not run: 
##D library("xergm")
##D data("alliances")
##D 
##D # btergm formulas look very similar to ERGM formulas.
##D # Note the R argument; usually want R > 1000.
##D # Here it is set to 50 to limit computation time.
##D # First, set the seed for replicability.
##D set.seed(123)
##D model <- btergm(allyNet ~ edges + gwesp(0, fixed = TRUE) 
##D     + edgecov(lNet) + edgecov(LSP) + edgecov(warNet) 
##D     + nodecov("polity") + nodecov("cinc") + absdiff("polity") 
##D     + absdiff("cinc") + edgecov(contigMat) + nodecov("year"), 
##D     R = 50)
##D 
##D # View estimates and confidence intervals.
##D summary(model)
##D 
##D # Evaluate model fit. Simulate 100 networks for each time point.
##D # Calculate edgewise shared partners, degree and geodesic distance 
##D # distance distributions.
##D alliance_gof <- gof(model, statistics = c(deg, esp, geodesic))
##D 
##D # Plot goodness of fit.
##D plot(alliance_gof)
## End(Not run)



