library(colorscience)


### Name: createIsoTempLinesTable
### Title: table of isotemperature lines for use with the Robertson Method
### Aliases: createIsoTempLinesTable
### Keywords: datasets

### ** Examples

# illuminant A
SPD = illuminants[1:51*2-1,c('wlnm','A')] # every 10 nm
isoTempLinesTable <- createIsoTempLinesTable(SPD)



