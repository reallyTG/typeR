library(tcpl)


### Name: tcplPlotFits
### Title: Plot summary fits based on fit and dose-response data
### Aliases: tcplPlotFits

### ** Examples


## Store the current config settings, so they can be reloaded at the end 
## of the examples
conf_store <- tcplConfList()
tcplConfDefault()

## tcplPlotFits needs data.tables supplying the concentration/response
## data stored in mc4_agg, as well as the fit information from mc4 or mc5.
## Additionally, tcplPlotFits can take level 6 data from mc6 and add the
## flag information to the plots. The following shows how to make level 5
## plots. Adding the 'flg' parameter would result in level 6 plots, and 
## loading level 4, rather than level 5 data, would result in level 4 plots.
 
l5 <- tcplLoadData(lvl = 5, fld = "m4id", val = 18609966)
l4_agg <- tcplLoadData(lvl = "agg", fld = "m4id", val = 18609966)

## Not run: 
##D pdf(file = "tcplPlotFits.pdf", height = 6, width = 10, pointsize = 10)
##D tcplPlotFits(dat = l5, agg = l4_agg)
##D graphics.off()
## End(Not run)

## While it is most likely the user will want to just save all of the plots 
## to view in a PDF, the 'browse' parameter can be used to quickly view 
## some plots. 

## Start by identifying some sample IDs to plot, then call tcplPlotFits with
## a subset of the data. This browse function is admittedly clunky. 
bpa <- tcplLoadChem(field = "chnm", val = "Bisphenol A")[ , spid]
l5_sub <- l5[spid %in% bpa] 
## Not run: 
##D tcplPlotFits(dat = l5_sub, 
##D              agg = l4_agg[m4id %in% l5_sub$m4id], 
##D              browse = TRUE)
## End(Not run)

## Reset configuration
options(conf_store)
 



