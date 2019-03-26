library(gjam)


### Name: gjamDeZero
### Title: Compress (de-zero) gjam data
### Aliases: gjamDeZero

### ** Examples

## Not run: 
##D library(repmis)
##D source_data("https://github.com/jimclarkatduke/gjam/blob/master/fungEnd.RData?raw=True")
##D 
##D ymat <- gjamReZero(fungEnd$yDeZero)  # OTUs stored without zeros
##D length(fungEnd$yDeZero$yvec)         # size of stored version
##D length(ymat)                         # full size
##D yDeZero <- gjamDeZero(ymat)
##D length(yDeZero$yvec)                 # recover de-zeroed vector
## End(Not run)



