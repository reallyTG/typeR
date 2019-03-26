library(WRTDStidal)


### Name: respred
### Title: Get WRTDS predictions from interpolation grids
### Aliases: respred respred.tidal respred.tidalmean

### ** Examples

##

# load a tidal object
data(tidobj)

# get fitted values for each quantile
res <- respred(tidobj)

# load a tidalmean object
data(tidobjmean)

# get predicted values
res <- respred(tidobjmean)




