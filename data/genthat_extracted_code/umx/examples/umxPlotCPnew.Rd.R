library(umx)


### Name: umxPlotCPnew
### Title: Draw and display a graphical figure of Common Pathway model
### Aliases: umxPlotCPnew

### ** Examples

## Not run: 
##D require(umx)
##D umx_set_optimizer("SLSQP")
##D data(GFF)
##D mzData = subset(GFF, zyg_2grp == "MZ")
##D dzData = subset(GFF, zyg_2grp == "DZ")
##D selDVs = c("gff", "fc", "qol", "hap", "sat", "AD") 
##D m1 = umxCP("new", selDVs = selDVs, sep = "_T", dzData = dzData, mzData = mzData, 
##D 	nFac = 3, correlatedA = TRUE
##D )
##D m1 = mxTryHardOrdinal(m1)
##D umxPlotCPnew(m1)
##D plot(m1) # no need to remember a special name: plot works fine!
## End(Not run)



