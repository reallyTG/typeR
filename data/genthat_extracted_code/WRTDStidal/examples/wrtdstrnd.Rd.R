library(WRTDStidal)


### Name: wrtdstrnd
### Title: Get WRTDS trends
### Aliases: wrtdstrnd wrtdstrnd.default wrtdstrnd.tidal
###   wrtdstrnd.tidalmean

### ** Examples

## load a fitted model object
data(tidfit)
data(tidfitmean)

## get trends

# setup month, year categories
mobrks <- list(c(1, 2, 3), c(4, 5, 6), c(7, 8, 9), c(10, 11, 12))
yrbrks <- c(1973, 1985, 1994, 2003, 2012)
molabs <- c('JFM', 'AMJ', 'JAS', 'OND')
yrlabs <- c('1974-1985', '1986-1994', '1995-2003', '2004-2012')

wrtdstrnd(tidfit, mobrks, yrbrks, molabs, yrlabs)
wrtdstrnd(tidfitmean, mobrks, yrbrks, molabs, yrlabs)

# get averages in each period
wrtdstrnd(tidfit, mobrks, yrbrks, molabs, yrlabs, aves = TRUE)



