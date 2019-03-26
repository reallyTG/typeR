library(secr)


### Name: speed
### Title: Speed Tips
### Aliases: speed 'Speed tips'
### Keywords: manip

### ** Examples


## Not run: 
##D 
##D ## compare timing of combined model with separate single-session models
##D ## for 5-session ovenbird mistnetting data: 2977/78 = 38-fold difference
##D 
##D system.time(fit1 <- secr.fit(ovenCH, buffer = 300, model = list(D ~
##D     session, g0 ~ session, sigma ~ session)))
##D ##   user  system elapsed 
##D ## 2470.99   20.62 2502.11 
##D 
##D system.time(fit2 <- lapply (ovenCH, secr.fit, buffer = 300))
##D ##   user  system elapsed 
##D ##   66.05    0.19   66.34 
##D 
##D ## ratio of density estimates
##D collate(fit1)[,1,1,"D"] / sapply(fit2, function(x) predict(x)["D","estimate"])
##D ## session=2005 session=2006 session=2007 session=2008 session=2009 
##D ##    1.0000198    1.0000603    0.9999761    0.9999737    0.9999539 
##D 
## End(Not run)




