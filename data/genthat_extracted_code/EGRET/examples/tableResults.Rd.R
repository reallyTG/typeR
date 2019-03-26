library(EGRET)


### Name: tableResults
### Title: Table of annual results for discharge, concentration and flux
### Aliases: tableResults
### Keywords: statistics water-quality

### ** Examples

eList <- Choptank_eList
# Water Year:
## Not run: 
##D tableResults(eList, fluxUnit = 1)
##D tableResults(eList, fluxUnit = 1, flowNormYears = c(1980:1995, 1997:2002, 2004:2011))
##D tableResults(eList, fluxUnit = 'kgDay', qUnit = 'cms')
##D returnedTable <- tableResults(eList, fluxUnit = 1)
##D # Winter:
##D eList <- setPA(eList, paLong=3,paStart=12)
##D tableResults(eList, fluxUnit = 1)
## End(Not run)



