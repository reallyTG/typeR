library(tcpl)


### Name: tcplPlotPlate
### Title: Plot plate heatmap
### Aliases: tcplPlotPlate

### ** Examples

## Store the current config settings, so they can be reloaded at the end 
## of the examples
conf_store <- tcplConfList()
tcplConfDefault()
 
d1 <- tcplLoadData(lvl = 1, fld = "acid", val = 1)
## Not run: 
##D tcplPlotPlate(dat = d1, apid = "09Apr2014.Plate.17")
## End(Not run)

## Reset configuration
options(conf_store)
 



