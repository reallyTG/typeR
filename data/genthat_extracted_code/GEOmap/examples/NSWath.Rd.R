library(GEOmap)


### Name: NSWath
### Title: Cross sectional Swaths of Earthquakes over Japan
### Aliases: NSWath
### Keywords: datasets

### ** Examples

## Not run: 
##D data(NSWath)
##D for(i in 1:length(NSWath))
##D {
##D dev.new()
##D LAB = attr(NSWath[[i]], "LAB")
##D 
##D XSECwin( NSWath[[i]] , iseclab=i, xLAB=LAB , labs=NULL, demo=TRUE  )   
##D }
##D 
## End(Not run)




