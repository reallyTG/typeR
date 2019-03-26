library(WRTDStidal)


### Name: getwts
### Title: Get weights for regression
### Aliases: getwts getwts.default

### ** Examples

##
data(tidobj)

# get weights for first row
first <- tidobj[1, ]
wts <- getwts(tidobj, first)

plot(wts, type = 'l')

## Not run: 
##D 
##D # get count of observations with grzero weights
##D sapply(1:nrow(tidobj), function(row) getwts(tidobj, tidobj[row, ], 
##D  ngrzero = TRUE))
## End(Not run)



