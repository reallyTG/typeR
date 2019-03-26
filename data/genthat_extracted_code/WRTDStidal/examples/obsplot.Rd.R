library(WRTDStidal)


### Name: obsplot
### Title: Plot observed response variable and salinity/flow data
### Aliases: obsplot obsplot.default obsplot.tidal obsplot.tidalmean

### ** Examples


## load a fitted tidal object
data(tidfit)

## plot using defaults
obsplot(tidfit)
 
## changing default
obsplot(tidfit, alpha = 0.5, size = 4, col = 'blue', lines = FALSE)

## plot a tidalmean object
data(tidfitmean)

obsplot(tidfitmean)



