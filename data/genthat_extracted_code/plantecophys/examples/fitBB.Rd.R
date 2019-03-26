library(plantecophys)


### Name: fitBB
### Title: Fit Ball-Berry type models of stomatal conductance
### Aliases: fitBB

### ** Examples


## Not run: 
##D # If 'mydfr' is a dataframe with 'Photo', 'Cond', 'VpdL' and 'CO2S', you can do:
##D myfit <- fitBB(mydfr, gsmodel = "BBOpti")
##D 
##D # Coefficients and a message:
##D myfit
##D 
##D # Coefficients only
##D coef(myfit)
##D 
##D # If you have a species variable, and would like to fit the model for each species,
##D # use fitBBs (see its help page ?fitBBs)
##D myfits <- fitBBs(mydfr, "species")
## End(Not run)



