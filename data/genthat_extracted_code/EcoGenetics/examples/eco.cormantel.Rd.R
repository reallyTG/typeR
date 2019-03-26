library(EcoGenetics)


### Name: eco.cormantel
### Title: Mantel and partial Mantel correlograms, omnidirectional and
###   directional
### Aliases: eco.cormantel

### ** Examples


## Not run: 
##D 
##D data(eco.test)
##D require(ggplot2)
##D 
##D ###############################
##D ## Omnidirectional correlogram
##D ###############################
##D 
##D corm <- eco.cormantel(M = dist(eco[["P"]]), size=1000,smax=7, XY = eco[["XY"]],
##D nsim = 99)
##D eco.plotCorrelog(corm)
##D 
##D corm <- eco.cormantel(M = dist(eco[["P"]]), size=1000,smax=7, XY = eco[["XY"]],
##D nsim = 99, test = "bootstrap")
##D eco.plotCorrelog(corm)
##D 
##D #######################################################
##D ## A directional approach based in bearing correlograms
##D #######################################################
##D 
##D corm_b <- eco.cormantel(M = dist(eco[["P"]]), size=1000,smax=7, XY = eco[["XY"]],
##D nsim = 99, angle = seq(0, 170, 10))
##D 
##D  # use eco.plotCorrelogB for this object
##D eco.plotCorrelogB(corm_b)
##D 
##D  # plot for the first distance class, 
##D  use a number between 1 and the number of classes to select the corresponding class
##D eco.plotCorrelogB(corm_b, interactivePlot = FALSE, var = 1) 
##D 
##D # partial Mantel correlogram
##D corm <- eco.cormantel(M = dist(eco[["P"]]), MC = dist(eco[["E"]]),
##D size=1000, smax=7, XY = eco[["XY"]], nsim = 99)
##D eco.plotCorrelog(corm)
##D 
##D # standard correlogram plots support the use of ggplot2 syntax
##D require(ggplot2)
##D mantelplot <- eco.plotCorrelog(corm, interactivePlot = FALSE)
##D mantelplot <- mantelplot + theme_bw() + theme(legend.position="none")
##D mantelplot
##D 
##D 
##D #-----------------------
##D # ACCESSORS USE EXAMPLE
##D #-----------------------
##D 
##D # the slots are accesed with the generic format 
##D # (ecoslot. + name of the slot + name of the object). 
##D # See help("EcoGenetics accessors")
##D 
##D ecoslot.OUT(corm)        # slot OUT
##D ecoslot.BREAKS(corm)     # slot BREAKS
##D 
## End(Not run)




