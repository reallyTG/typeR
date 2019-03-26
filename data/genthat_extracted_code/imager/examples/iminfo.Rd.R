library(imager)


### Name: iminfo
### Title: Return information on image file
### Aliases: iminfo

### ** Examples

## Not run: 
##D someFiles <- dir("*.png") #Find all PNGs in directory
##D iminfo(someFiles[1])
##D #Get info on all files, as a data frame
##D info <- plyr::ldply(someFiles,function(v) iminfo(v) %>% as.data.frame) 
## End(Not run)



