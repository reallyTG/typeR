library(gjam)


### Name: gjamTrimY
### Title: Trim gjam response data
### Aliases: gjamTrimY

### ** Examples

## Not run: 
##D library(repmis)
##D source_data("https://github.com/jimclarkatduke/gjam/blob/master/forestTraits.RData?raw=True")
##D 
##D y   <- gjamReZero(fungEnd$yDeZero)     # re-zero data
##D dim(y)
##D y   <- gjamTrimY(y, minObs = 200)$y    # species in >= 200 observations
##D dim(y)
##D tail(colnames(y))    # last column is 'other'
## End(Not run)



