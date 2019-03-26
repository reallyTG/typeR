library(geonapi)


### Name: GNPrivConfiguration
### Title: A GeoNetwork privilege configuration
### Aliases: GNPrivConfiguration GNPriv GNPrivConfiguration
### Keywords: GeoNetwork configuration privilege

### ** Examples

## Not run: 
##D  priv <- GNPriv$new(group="all", privileges=c("view","dynamic","featured"))
## End(Not run)

## Not run: 
##D  pcfg <- GNPrivConfiguration$new()
##D  pcfg$setPrivileges("all", c("view","dynamic","featured"))
## End(Not run)




