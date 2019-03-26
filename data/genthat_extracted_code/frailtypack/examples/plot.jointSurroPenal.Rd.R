library(frailtypack)


### Name: plot.jointSurroPenal
### Title: Plot Method for the one-step Joint surrogate model for the
###   evaluation of a canditate surrogate endpoint.
### Aliases: plot.jointSurroPenal lines.jointSurroPenal
### Keywords: surrogate

### ** Examples



## Not run: 
##D 
##D 
##D ###--- Joint surrogate model ---###
##D ###---evaluation of surrogate endpoints---###
##D 
##D data(dataOvarian)
##D joint.surro.ovar <- jointSurroPenal(data = dataOvarian, n.knots = 8, 
##D                 init.kappa = c(2000,1000), indice.alpha = 0, nb.mc = 200, 
##D                 scale = 1/365)
##D 
##D # Baseline Hazards fonctions for both the surrogate endpoint 
##D # and the true endpoint
##D plot(joint.surro.ovar,endpoint = 2,type.plot = "Haz", conf.bands = T)   
##D 
##D # Baseline survival fonctions for both the surrogate endpoint 
##D # and the true endpoint
##D plot(joint.surro.ovar,endpoint = 2,type.plot = "Su", conf.bands = T)  
##D              
##D 
##D 
## End(Not run)





