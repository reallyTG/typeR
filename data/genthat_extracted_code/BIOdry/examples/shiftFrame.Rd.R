library(BIOdry)


### Name: shiftFrame
### Title: MEDS formatting
### Aliases: shiftFrame

### ** Examples

##tree-ring widths formated as a groupedData object:
data(Prings05,envir = environment())

## Formatting the groupedData object into a ring-data frame:
pwide <- shiftFrame(Prings05, from = 'mm', to = 'mmm')
str(pwide)
## Formatting the ring-data frame into a groupedData object, and
## changing SI units from micrometers to milimeters:
plong <- shiftFrame(pwide,from = 'mmm', to = 'mm')
plot(plong)



