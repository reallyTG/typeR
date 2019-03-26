library(colorscience)


### Name: spectra2CRIGAIFSCI
### Title: CRI, GAI and FSCI from spectra
### Aliases: spectra2CRIGAIFSCI
### Keywords: datasets

### ** Examples

# illuminant A
## Not run: 
##D SPD = illuminants[1:51*2-1,c('wlnm','A')] # every 10 nm
##D isoTempLinesTable <- createIsoTempLinesTable(SPD)
##D CCT <- spectra2CCT(SPD)
##D spectra2CRIGAIFSCI(SPD, isoTempLinesTable, CCT)
##D spectra2CRIGAIFSCI(SPD, isoTempLinesTable)
##D spectra2CRIGAIFSCI(SPD)
## End(Not run)



