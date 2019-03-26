library(MBESS)


### Name: ss.aipe.c.ancova.sensitivity
### Title: Sensitivity analysis for sample size planning for the
###   (unstandardized) contrast in randomized ANCOVA from the Accuracy in
###   Parameter Estimation (AIPE) Perspective
### Aliases: ss.aipe.c.ancova.sensitivity
### Keywords: design

### ** Examples

## Not run: 
##D ss.aipe.c.ancova.sensitivity(true.error.var.ancova=30, 
##D est.error.var.ancova=30, rho=.2, mu.y=c(10,12,15,13), mu.x=2, 
##D G=1000, sigma.x=1.3, sigma.y=2, c.weights=c(1,0,-1,0), width=3)
##D 
##D ss.aipe.c.ancova.sensitivity(true.error.var.anova=36, 
##D est.error.var.anova=36, rho=.2, est.rho=.2, G=1000, 
##D mu.y=c(10,12,15,13), mu.x=2, sigma.x=1.3, sigma.y=6, 
##D c.weights=c(1,0,-1,0), width=3, assurance=NULL)
## End(Not run)



