library(EcoGenetics)


### Name: eco.variogram
### Title: Empirical variogram
### Aliases: eco.variogram

### ** Examples

## Not run: 
##D 
##D data(eco.test)
##D variog <- eco.variogram(Z = eco[["P"]][, 2],XY =  eco[["XY"]])
##D eco.plotCorrelog(variog)
##D 
##D # variogram plots support the use of ggplot2 syntax
##D require(ggplot2)
##D variogplot <- eco.plotCorrelog(variog) + theme_bw() + theme(legend.position="none")
##D variogplot
##D 
##D #-----------------------
##D # ACCESSORS USE EXAMPLE
##D #-----------------------
##D 
##D # the slots are accessed with the generic format 
##D # (ecoslot. + name of the slot + name of the object). 
##D # See help("EcoGenetics accessors")
##D 
##D ecoslot.OUT(variog)        # slot OUT
##D ecoslot.BREAKS(variog)     # slot BREAKS
##D 
## End(Not run)




