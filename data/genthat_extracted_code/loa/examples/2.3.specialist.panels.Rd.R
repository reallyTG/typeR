library(loa)


### Name: 2.3.specialist.panels
### Title: Special panel functions 03
### Aliases: 2.3.specialist.panels panel.zcasePiePlot
###   panel.zcasePieSegmentPlot
### Keywords: methods

### ** Examples


## Example 1
## plotting georeferenced pie plots

#  Using a subsample of lat.lon.meuse
temp <- lat.lon.meuse[sample(1:155, 15),]

## Not run: 
##D #  plot Cu/Pb/Zn pie plots at sampling locations
##D    loaPlot(copper+lead+zinc~longitude*latitude, 
##D            panel=panel.zcasePiePlot, data=temp)
##D #  then rescale smaller pie segments on the fly
## End(Not run)

loaPlot(copper*10+lead*4+zinc~longitude*latitude, 
        panel=panel.zcasePiePlot, data=temp)




